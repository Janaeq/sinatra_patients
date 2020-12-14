class Doctor < ActiveRecord::Base
    has_many :patients

    validates :name, :specialty, :clinic_days, :clinic_location, :on_call_days, presence: true #flash error Provider already exists. Try again
end