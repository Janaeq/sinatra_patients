class UsersController < ApplicationController
    # inherit from app controller so that you don't have to inherit from sinatra base, configure views, require environment, etc
    
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        # find the user, authenticate them, create a session, and redirect.
        # if user does not exist, send to error page?
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password]) # method from bcrypt has_secure_password - compares plain text pw to salted pw
            # create the k/v pair in the session for the user to log in
            # user is not logged in until their user id is in the session hash with a value
            session[:user_id] = user.id
            
            redirect to '/doctors'
        else
            redirect to '/login'
        end
    end
end