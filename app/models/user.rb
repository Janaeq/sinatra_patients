class User < ActiveRecord::Base
    has_secure_password # bcrypt macro that allows authenticate method (salts the password)
    validates :name, :username, presence: true
    validates :name, :username, :password, length: { minimum: 2 }
    validates :username, uniqueness: true
end