class Doctor < ActiveRecord::Base
    has_many :patients
    
    belongs_to :user

    validates :name, :specialty, :clinic_days, :clinic_location, :on_call_days, presence: true
    validates :name, uniqueness: true
    validates :name, :clinic_days, :on_call_days, :specialty, :clinic_location, length: { minimum: 2 }
end