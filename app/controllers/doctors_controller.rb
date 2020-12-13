class DoctorsController < ApplicationController
    
    #Index

    get '/doctors' do
        @doctors = Doctor.all
        #index - Shows all doctors
        #select a doctor to get more info
        #can lead to link to add a new doctor
        erb :'doctors/index'
    end

    #CREATE

    get '/doctors/new' do
        #creates a new doctor
        erb :'doctors/new'
    end

    post '/doctors' do
        #saves the new doctor to the database
        #redirects to that new doctor's /doctors/:id page
    end

    #READ

    get '/doctors/:id' do
        #shows a specific doctor and their info
        #can lead to link to update doctor info
        #can lead to link to view this doctor's patients
        @doctor = Doctor.find_by_id(params[:id])
        erb :'doctors/show'
    end

    #UPDATE

    get '/doctors/:id/edit' do
        #renders the form to update a specific doctor's info
    end

    patch 'doctors/:id' do
        #actually updates the info
    end

    #DELETE

    delete '/doctors/:id' do
        #deletes this doctor
    end

end