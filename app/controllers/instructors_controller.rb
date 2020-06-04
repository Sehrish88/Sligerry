class InstructorsController < ApplicationController
    

    def new
      @instructor = Instructor.new 

    end 

    def create
        @instructor = Instructor.new(instructor_params)
        if @instructor.save
          session[:instructor_id] = @instructor.id
          redirect_to instructor_path(@instructor)
        else
          render :new
        end
    end

    def show
        @instructor = Instructor.find(params[:id]) 
    end 

    def index
        @instructors = Instructor.all 
    end 
    
      private
    
      def instructor_params 
        params.require(:instructor).permit(:name, :email, :password, :password_confirmation) 
      end
end
