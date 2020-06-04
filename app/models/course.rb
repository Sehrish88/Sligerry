class Course < ApplicationRecord
    has_many :schedules
    has_many :instructors, through: :schedules
end
