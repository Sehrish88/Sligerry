class InstructorsController < ApplicationController
    

    def new
      @instructor = Instructor.new 

    end 

    def create
        @instructor = Instructor.new(instructor_params)
        if @instructor.save
          session[:instructor_id] = @instructor.id
          flash[:notice] = "Registration Sucessful"
          redirect_to instructor_path(@instructor)
        else
          flash[:alert] = "Registration Unsuccesful"
          render :new
        end
    end

    def show
      find_instructor 
    end 

    def index
        @instructors = Instructor.all 
    end 

    def edit 
      find_instructor
    end 
    
    def update 
      find_instructor
      @instructor.update(instructor_params)
      if @instructor.valid?
        flash[:notice] = "Sucessfully Updated Instructor Information"
        redirect_to instructor_path(@instructor)
      else
      
        render :edit 
      end 
    end 

    def destroy

    end 

      private
    
      def instructor_params 
        params.require(:instructor).permit(:name, :email, :password, :password_confirmation) 
      end
end
