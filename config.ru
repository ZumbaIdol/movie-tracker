require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use UsersController
use MoviesController
use SessionsController
use Rack::MethodOverride
use Rack::Flash
run ApplicationController


