require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/assignment")
require("./lib/employee")
require("./lib/project")
require("pry")

get('/') do
  @employees = Employee.all()
  @projects = Project.all()
  erb(:home)
end

get('/employees/new') do
  erb(:employee_form)
end

get('/projects/new') do
  erb(:project_form)
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

post('/projects') do
  title = params.fetch('title')
  project = Project.new({:title => title, :id => nil})
  project.save()
  @projects = Project.all()
  erb(:projects)
end

get('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i())
  @available_employees = Employee.all() - @project.employees
  erb(:project)
end

post('/projects/:id')do
  @project = Project.find(params.fetch("id").to_i)
  new_employee = Employee.find(params.fetch("employee_id"))
  @project.employees.push(new_employee)
  @available_employees = Employee.all() - @project.employees
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params.fetch("id").to_i)
  erb(:edit_project)
end

patch('/projects/:id') do
  title = params.fetch("title")
  @project = Project.find(params.fetch("id").to_i)
  @project.update({:title => title})
  @available_employees = Employee.all() - @project.employees
  erb(:project)
end

delete('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i)
  @project.delete()
  @projects = Project.all()
  erb(:projects)
end

get('/employees') do
  @employees = Employee.all()
  erb(:employees)
end

post('/employees') do
  name = params.fetch('name')
  employee = Employee.new({:name => name, :id => nil})
  employee.save()
  @employees = Employee.all()
  erb(:employees)
end

get('/employees/:id')do
  @employee = Employee.find(params.fetch("id").to_i)
  @available_projects = Project.all() - @employee.projects
  erb(:employee)
end

post('/employees/:id')do
  @employee = Employee.find(params.fetch("id").to_i)
  new_project = Project.find(params.fetch("project_id"))
  @employee.projects.push(new_project)
  @available_projects = Project.all() - @employee.projects
  assignment = Assignment.where()
  erb(:employee)
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i)
  erb(:edit_employee)
end

patch('/employees/:id')do
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i)
  @employee.update({:name => name})
  @employees = Employee.all()
  @available_projects = Project.all() - @employee.projects
  erb(:employee)
end

delete('/employees/:id') do
  @employee = Employee.find(params.fetch("id").to_i)
  @employee.delete()
  @employees = Employee.all()
  erb(:employees)
end
