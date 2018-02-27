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
  @employees = Employee.all()
  erb(:project)
end

patch('/projects/:id')do
  @project = Project.find(params.fetch("id").to_i)
  new_employee = Employee.find(params.fetch("employee_id"))
  @project.employees.push(new_employee)
  @employees = Employee.all()
  erb(:project)
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
  @projects = Project.all()
  erb(:employee)
end

patch('/employees/:id')do
  @employee = Employee.find(params.fetch("id").to_i)
  new_project = Project.find(params.fetch("project_id"))
  @employee.projects.push(new_project)
  @projects = Project.all()
  erb(:employee)
end
