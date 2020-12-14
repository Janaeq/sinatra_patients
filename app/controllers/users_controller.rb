class UsersController < ApplicationController
    # inherit from app controller so that you don't have to inherit from sinatra base, configure views, require environment, etc
    
    get "/login" do
        #if logged in, redirect to /users/:id
        if logged_in? 
            redirect to "/users/#{current_user.id}"
        else 
            #if not, render the login form
            erb :'users/login'
        end
    end

    post "/login" do
        # find the user, authenticate them, create a session, and redirect.
        # if user does not exist, send to error page?
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password]) # method from bcrypt has_secure_password - compares plain text pw to salted pw
            # user is not logged in until their user id is in the session hash with a value
            session[:user_id] = user.id # create the k/v pair in the session for the user to log in
            redirect "/users/#{user.id}" #needs to be double quotes in order to interpolate the user id
        else #if the user is not logged in redirect to the login page
            flash[:error] = "Invalid Credentials"
            #error message appears here
            redirect "/login"
        end
    end

    get "/users/:id" do #dynamic route specific to the user that is logged in
        @user = User.find_by(id: params[:id])
        erb :'users/welcome'
    end

    get "/enroll" do
        #creates a new user
        erb :'users/enroll'
    end

    post "/users" do
        # create a class variable so that it works in your "/users/:id" route
        user = User.new(username: params[:username], password: params[:password], name: params[:name])
        if user.save
            # @user = User.create(username: params[:username], password: params[:password], name: params[:name])
            #same as the post /login route to log in the new user
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            flash[:error] = user.errors.full_messages.to_sentence
            redirect to "/enroll"
        end
        
    end

    get "/logout" do
        session.clear #clears the entire session hash, meaning the user is no longer logged in
        redirect to "/"
    end
end