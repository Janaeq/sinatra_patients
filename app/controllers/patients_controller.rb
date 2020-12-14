class PatientsController < ApplicationController

    #Index

    get "/doctors/:id/patients" do #is this convention? idk
        @doctor = Doctor.find_by_id(params[:id])
        erb :'patients/index'
    end
    
    #CREATE 
    
    get "/doctors/:id/patients/new" do #IS THIS CONVENTIONNNNNNNN
        #creates a new patient 
        @doctor_id = params[:id]
        erb :'patients/new'
    end

    post '/patients' do
        #saves the new patient to the database
        #redirects to that patient's /patients/:id page
        patient = Patient.create(name: params[:name], address: params[:address], insurance: params[:insurance], diagnosis: params[:diagnosis], medications: params[:medications], doctor_id: params[:doctor_id])
        redirect to "/patients/#{patients.id}"
    end
    
    #READ

    get '/patients/:id' do
        #shows a specific patient
        #can lead to link to update patient info
        @patient = Patient.find_by(id: params[:id])
        erb :'patients/show'
    end

    #UPDATE

    get '/patients/:id/edit' do
        #renders the form to update a specific doctor's info
    end

    patch 'patients/:id' do
        #actually updates the info
    end

    #DELETE

    delete '/patients/:id' do
        #deletes this doctor
    end
end 