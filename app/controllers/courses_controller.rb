class CoursesController < ApplicationController
     def index 

     end 

     def show
        @course = Course.find_by(id: params[:id])
     end 

     def new 
        @course = Course.new 
     end 

     def create 
        @course = Course.new(course_params)
        if @course.save
            redirect_to course_path(@course)
        else 
            render :new
        end 
     end 

     private

     def course_params
        params.require(:course).permit(:title, :description)
     end 

end
