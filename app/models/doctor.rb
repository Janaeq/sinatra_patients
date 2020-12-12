class Doctor < ActiveRecord::Base
    has_many :patients
    has_secure_password # bcrypt macro that allows authenticate method (salts the password)
end