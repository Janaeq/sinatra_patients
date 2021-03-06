require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #enables the session hash
    set :session_secret, "vzezu1u" #secret key that adds more security to the program
    #register flash gem into program
    #note that they can only be displayed on redirects
    #will appear as a single GET request
    register Sinatra::Flash 
  end

  get "/" do
    redirect to "/login"
  end

  helpers do
    def logged_in?
      !!current_user 
    end
    #keeps track of the user that is logged in
    def current_user
      User.find_by(id: session[:user_id])
    end

    def authorized_to_edit(user)
      # binding.pry
      user == current_user
    end

  end

end
