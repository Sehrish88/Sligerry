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

    def edit 
      @instructor = Instructor.find(params[:id]) 
    end 
    
    def update 
      @instructor = Instructor.find_by(id: params[:id])
      @instructor.update(instructor_params)
      if @instructor.valid?
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
