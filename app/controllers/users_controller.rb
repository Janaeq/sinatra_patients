class UsersController < ApplicationController
    # inherit from app controller so that you don't have to inherit from sinatra base, configure views, require environment, etc
    
    get '/login' do
        erb :login
    end

    post '/login' do
        binding.pry
    end




end