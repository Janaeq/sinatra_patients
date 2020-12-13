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

  helpers do
    # def logged_in?
    #keeps track of the user that is logged in
    def current_user
      User.find_by(id: session[:user_id])
    end
  end

end
