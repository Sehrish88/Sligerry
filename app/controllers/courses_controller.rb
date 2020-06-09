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
       @course = Course.find_by(id: params[:id])
     end 

     def update 
       @course = Course.find_by(id: params[:id])
       @course.update(course_params)
       if @course.valid?
         redirect_to course_path(@course)
       else 
         render :edit 
       end 

     end 

     def destroy
       @course = Course.find_by(id: params[:id])
       if @course.instructor == current_instructor 
       @course.delete
       else 

      end 
       redirect_to instructor_path(current_instructor)
    end 
     

     private

     def course_params
        params.require(:course).permit(:title, :description, schedule_attributes: [:days, :time, :semester])
     end 

end
