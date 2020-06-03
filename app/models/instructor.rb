class Instructor < ApplicationRecord
    has_many :schedules
    has_many :courses, through: :schedules 
    
    has_secure_password
    validates_confirmation_of :password
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true 
end
