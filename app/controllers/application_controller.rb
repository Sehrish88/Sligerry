class ApplicationController < ActionController::Base

    helper_method :current_instructor 
    #
    def current_instructor
      Instructor.find_by(id: session[:instructor_id])
    end
  
    def require_login
      if current_instructor
        current_instructor 
      else
          redirect_to '/'
        end
    end

end
