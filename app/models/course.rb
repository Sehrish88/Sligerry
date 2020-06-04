class Course < ApplicationRecord
    belongs_to :instructor
    belongs_to :schedule 

    
end
