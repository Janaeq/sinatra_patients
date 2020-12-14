class Patient < ActiveRecord::Base
    belongs_to :doctor

    validates :name, :address, :diagnosis, presence: true
    validates :name, uniqueness: true
    validates :name, :address, :diagnosis, length: { minimum: 3 }
end