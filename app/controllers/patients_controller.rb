class PatientsController < ApplicationController

    #Index

    get "/doctors/:id/patients" do
        if logged_in?
            @doctor = Doctor.find_by_id(params[:id])
            erb :'patients/index'
        else
            flash[:error] = "You must log in to view this page"
            redirect to "/"
        end
    end
    
    #CREATE 
    
    get "/doctors/:id/patients/new" do 
        if logged_in?
            #creates a new patient 
            @doctor_id = params[:id]
            erb :'patients/new'
        else
            flash[:error] = "You must log in to view this page"
            redirect to "/"
        end
    end

    post '/patients' do
        #saves the new patient to the database
        #redirects to that patient's /patients/:id page
        patient = Patient.new(name: params[:name], address: params[:address], insurance: params[:insurance], diagnosis: params[:diagnosis], medications: params[:medications], doctor_id: params[:doctor_id])
        if patient.save
            redirect to "/patients/#{patient.id}"
        else
            flash[:error] = patient.errors.full_messages.to_sentence
            redirect to "/doctors/#{patient.doctor_id}/patients/new"
        end
    end
    
    #READ

    get '/patients/:id' do
        if logged_in?
            #shows a specific patient
            #can lead to link to update patient info
            @patient = Patient.find_by(id: params[:id])
            erb :'patients/show'
        else
            flash[:error] = "You must log in to view this page"
            redirect to "/"
        end
    end

    #UPDATE

    get '/patients/:id/edit' do
        if logged_in?
            #get the patient that you want to edit
            #renders the form to update a specific patient's info
            @patient = Patient.find(params[:id])
            erb :'patients/edit'
        else
            flash[:error] = "You must log in to view this page"
            redirect to "/"
        end
    end

    patch '/patients/:id' do
        #actually updates the info
        patient = Patient.find(params[:id])
        if patient.update(name: params[:name], address: params[:address], insurance: params[:insurance], medications: params[:medications])
            redirect to "patients/#{patient.id}"
        else
            flash[:error] = patient.errors.full_messages.to_sentence
            redirect to "patients/#{patient.id}/edit"
        end
    end

    #DELETE

    delete '/doctors/:doctor_id/patients/:id' do #is this convention?
        #deletes this patient
        @doctor = Doctor.find(params[:doctor_id])
        @patient = Patient.find(params[:id])
        @patient.destroy
        redirect to "/doctors/#{@doctor.id}/patients"
    end
end 