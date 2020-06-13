class Course < ApplicationRecord
    belongs_to :instructor
    belongs_to :schedule 

    validates :title, presence: true
    validates :title, uniqueness: true 
    validates :description, presence: true 
    

    accepts_nested_attributes_for :schedule 

    scope :course_type, -> (query) { where("description LIKE ?", "%" + query + "%") } 
    
end 
