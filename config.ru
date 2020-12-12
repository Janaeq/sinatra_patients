require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


# other controllers will be done with 'use'

use Rack::MethodOverride # middleware that allows to send patch and delete requests
run ApplicationController
