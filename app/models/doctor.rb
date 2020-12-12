class Doctor < ActiveRecord::Base
    has_secure_password # bcrypt macro that allows authenticate method (salts the password)
    
    has_many :patients
end