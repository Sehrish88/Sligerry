class Course < ApplicationRecord
    belongs_to :instructor
    belongs_to :schedule 

    accepts_nested_attributes_for :schedule 
end 
