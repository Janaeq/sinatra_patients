class UsersController < ApplicationController
    # inherit from app controller so that you don't have to inherit from sinatra base, configure views, require environment, etc
    
    get '/login' do
        #if logged in, redirect to /users/:id
        if logged_in? 
            redirect to "/users/#{current_user.id}"
        else 
            #if not, render the login form
            erb :'users/login'
        end
    end

    post '/login' do
        # find the user, authenticate them, create a session, and redirect.
        # if user does not exist, send to error page?
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password]) # method from bcrypt has_secure_password - compares plain text pw to salted pw
            # create the k/v pair in the session for the user to log in
            # user is not logged in until their user id is in the session hash with a value
            session[:user_id] = user.id
            
            redirect "/users/#{user.id}" #needs to be double quotes in order to interpolate the user id
        else
            redirect '/login'
        end
    end

    get '/users/:id' do
        erb :'users/welcome'
    end

    get "/enroll" do
        erb :'users/enroll'
    end

    post "/users" do
        @user = User.create(params)

        session[:user_id] = @user.id

        redirect to "/users/#{@user.id}"
    end

    get '/logout' do
        session.clear #clears the entire session hash
        redirect to '/'
    end
end