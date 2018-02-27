require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/assignment")
require("./lib/employee")
require("./lib/project")

get('/') do
  @employees = Employee.all()
  @projects = Project.all()
  erb(:home)
end
