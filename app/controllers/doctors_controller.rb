class DoctorsController < ApplicationController
    
    #Index

    get '/user/:id/doctors' do
        if logged_in?
            @user = User.find(params[:id])
            #index - Shows doctors vthat belong to this user
            #select a doctor to get more info
            #can lead to link to add a new doctor
            erb :'doctors/index'
        else
            flash[:error] = "You must log in to view this page"
            redirect to "/"
        end
    end

    #CREATE

    get '/user/:id/doctors/new' do
        @user = User.find(params[:id])
        if authorized_to_edit(@user)
            #creates a new doctor that belongs to the logged in user
            erb :'doctors/new'
        else
            flash[:error] = "Not authorized. Please try again."
            redirect to "/"
        end
    end

    post '/doctors' do
        #saves the new doctor to the database
        #redirects to that new doctor's /doctors/:id page
        doctor = Doctor.new(name: params[:name], specialty: params[:specialty], clinic_days: params[:clinic_days], clinic_location: params[:clinic_location], on_call_days: params[:on_call_days], user_id: params[:user_id])
        if doctor.save
            redirect to "/doctors/#{doctor.id}"
        else
            flash[:error] = doctor.errors.full_messages.to_sentence
            redirect to "/doctors/#{doctor.user_id}/patients/new"
        end
        
    end

    #READ

    get '/doctors/:id' do
        if logged_in?
            #shows a specific doctor and their info
            #can lead to link to update doctor info
            #can lead to link to view this doctor's patients
            @doctor = Doctor.find(params[:id])
            erb :'doctors/show'
        else
            flash[:error] = "You must log in to view this page"
            redirect to "/"
        end
    end


    #UPDATE

    get "/doctors/:id/edit" do
        @doctor = Doctor.find(params[:id])
        if authorized_to_edit(@doctor.user)
            #renders the form to update a specific doctor's info
            erb :'doctors/edit'
        else
            flash[:error] = "Not authorized. Please try again."
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

    delete '/users/:user_id/doctors/:id' do
        #deletes this doctor
        user = User.find(params[:user_id])
        doctor = Doctor.find(params[:id])
        doctor.patients.each do |patient|
            patient.destroy #deletes this doctor's patients
        end
        doctor.destroy 
        redirect to "/user/#{user.id}/doctors"
    end

end