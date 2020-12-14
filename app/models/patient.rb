class Patient < ActiveRecord::Base
    belongs_to :doctor

    validates :name, presence: true #flash error patient already exists
end