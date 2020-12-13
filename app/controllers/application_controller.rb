require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #enables the session hash
    set :session_secret, "vzezu1u" #secret key that adds more security to the program
  end

  get "/" do
    redirect to "/login"
  end



end
