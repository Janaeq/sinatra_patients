class PatientsController < ApplicationController

    #Index

    get '/patients/:id' do
        #shows patients that belong to a specific doctor
        #connected by foreign key
        #limits to one patient :(
        @patient = Patient.find_by(id: params[:id])
        # binding.pry
        erb :'patients/show'
    end
end 