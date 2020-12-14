class Doctor < ActiveRecord::Base
    has_many :patients

    validates :name, presence: true #flash error Provider already exists. Try again
end