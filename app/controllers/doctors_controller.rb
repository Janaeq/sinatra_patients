class DoctorsController < ApplicationController
    
    #Index

    get '/doctors' do
        if logged_in?
            @doctors = Doctor.all
            #index - Shows all doctors
            #select a doctor to get more info
            #can lead to link to add a new doctor
            erb :'doctors/index'
        else
            flash[:error] = "You must log in to view this page"
            redirect to "/"
        end
    end

    #CREATE

    get '/doctors/new' do
        if logged_in?
            #creates a new doctor
            erb :'doctors/new'
        else
            flash[:error] = "You must log in to view this page"
            redirect to "/"
        end
    end

    post '/doctors' do
        #saves the new doctor to the database
        #redirects to that new doctor's /doctors/:id page
        doctor = Doctor.new(name: params[:name], specialty: params[:specialty], clinic_days: params[:clinic_days], clinic_location: params[:clinic_location], on_call_days: params[:on_call_days])
        if doctor.save
            redirect to "/doctors/#{doctor.id}"
        else
            flash[:error] = doctor.errors.full_messages.to_sentence
            redirect to "doctors/new"
        end
        
    end

    #READ

    get '/doctors/:id' do
        if logged_in?
            #shows a specific doctor and their info
            #can lead to link to update doctor info
            #can lead to link to view this doctor's patients
            @doctor = Doctor.find_by_id(params[:id])
            erb :'doctors/show'
        else
            flash[:error] = "You must log in to view this page"
            redirect to "/"
        end
    end


    #UPDATE

    get '/doctors/:id/edit' do
        if logged_in?
            #renders the form to update a specific doctor's info
            @doctor = Doctor.find(params[:id])
            erb :'doctors/edit'
        else
            flash[:error] = "You must log in to view this page"
            redirect to "/"
        end
    end

    patch '/doctors/:id' do
        #actually updates the info
        doctor = Doctor.find(params[:id])
        if doctor.update(name: params[:name], clinic_days: params[:clinic_days], clinic_location: params[:clinic_location], on_call_days: params[:on_call_days])
            redirect to "doctors/#{doctor.id}"
        else
            flash[:error] = doctor.errors.full_messages.to_sentence
            redirect to "doctors/#{doctor.id}/edit"
        end
    end

    #DELETE

    delete '/doctors/:id' do
        #deletes this doctor
        @doctor = Doctor.find(params[:id])
        @doctor.patients.each do |patient|
            patient.destroy #deletes this doctor's patients
        end
        @doctor.destroy 
        redirect to "/doctors"
    end

end