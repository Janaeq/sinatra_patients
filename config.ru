require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
# middleware that allows to send patch and delete requests (has to be above mounted controllers)
use Rack::MethodOverride 

use PatientsController
use DoctorsController
use UsersController # 'mount' the controller in config.ru with 'use' so that sinatra knows to use this file when running ApplicationController?

run ApplicationController
 