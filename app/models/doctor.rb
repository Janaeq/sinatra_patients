class Doctor < ActiveRecord::Base
    has_many :patients

    validates :name, :specialty, :clinic_days, :clinic_location, :on_call_days, presence: true
    validates :name, uniqueness: true
    validates :name, length: { minimum: 2 }
    validates :specialty, :clinic_location, length: { in: 5..200 }
    validates :clinic_days, :on_call_days, length: { minimum: 6 }
end