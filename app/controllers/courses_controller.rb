class CoursesController < ApplicationController

  


     def index 
      if !params[:instructor_id]
         @courses = Course.all 
      else 
         #check if instructor exists 
         instructor = Instructor.find_by(id: params[:id]) 
         @courses = instructor.courses
      end 
    end 

     def show 
         @instructor = Instructor.find_by(id: params[:instructor_id]) 
         @course = Course.find_by(id: params[:id]) 
      
     end 

     def new  
      #byebug
      
        @course = Course.new 
        @course.build_schedule 
        
     end 

     def create
       #byebug
        
        @course = Course.create(course_params)
        @course.instructor = current_instructor 
        if @course.save
            redirect_to instructor_course_path(@course.instructor, @course) 
        else 
            render :new
        end 
     end 

     def edit 

     end 

     def update 

     end 
     

     private

     def course_params
        params.require(:course).permit(:title, :description, schedule_attributes: [:days, :time, :semester])
     end 

end
