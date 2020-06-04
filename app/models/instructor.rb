class Instructor < ApplicationRecord
    has_many :courses
    has_many :schedules, through: :courses  
    
    #accepts_nested_attributes_for :courses 
    
    has_secure_password

    validates_confirmation_of :password
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true 
end
