class Course < ApplicationRecord
    has_many :schedules
    has_many :students, through: :schedules
end
