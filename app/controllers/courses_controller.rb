class CoursesController < ApplicationController
    
  


     def index 
      
        if params[:search] 
          @courses = Course.course_type(params[:search])
        else 
         @courses = Course.all 
        end 


    end 

     

     def show 
         @instructor = Instructor.find_by(id: params[:instructor_id]) 
         find_course 
      
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
          flash[:notice] = "Sucessfully Created Course"
            redirect_to instructor_course_path(@course.instructor, @course) 
        else 
            render :new
        end 
     end 

     def edit 
       find_course 
     end 

     def update 
      find_course
       @course.update(course_params)
       if @course.valid?
        flash[:notice] = "Sucessfully Updated Course"
         redirect_to instructor_course_path(@course.instructor, @course) 
       else 
         render :edit 
       end 

     end 

     def destroy
      find_course
       if @course.instructor == current_instructor 
       @course.delete
       else 
        redirect_to login_path 
      end 
      flash[:notice] = "Sucessfully deleted Course"
       redirect_to instructor_path(current_instructor)
    end 
     

     private

     def course_params
        params.require(:course).permit(:title, :description, schedule_attributes: [:days, :time, :semester])
     end 

end
