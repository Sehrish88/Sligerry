class ApplicationController < ActionController::Base

    helper_method :current_instructor
    helper_method :find_course 
    helper_method :find_instructor 
    #
    def current_instructor
      Instructor.find_by(id: session[:instructor_id])
    end

    def find_course 
      @course = Course.find_by(id: params[:id])
    end 

    def find_instructor 
      @instructor = Instructor.find(params[:id]) 
    end 
  
    def require_login
      if current_instructor
        current_instructor 
      else
          redirect_to '/'
        end
    end

    

end
