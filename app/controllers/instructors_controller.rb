class InstructorsController < ApplicationController
    def show
        @instructor = Instructor.find(params[:id]) 
    end 

    def new
      @instructor = Instructor.new 

    end 

    def create
        @instructor = Instructor.new(instructor_params)
        if @instructor.save
          session[:instructor_id] = @instrutor.id
          redirect_to instructor_path(@instructor)
        else
          render :new
        end
      end
    
      private
    
      def student_params
        params.require(:instructor).permit(:name, :email, :password, :password_confirmation)
      end
end
