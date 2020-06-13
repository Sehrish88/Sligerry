class Schedule < ApplicationRecord
    has_many :courses
    has_many :instructors, through: :courses

    validates :days, presence: true 
    validates :time, presence: true
    validates :semester, presence: true 
end
