class SessionsController < ApplicationController

    def create
        @instructor = Igit add nstructor.find_by(email: params[:instructor][:email])
        if @instructor && @instructor.authenticate(params[:instructor][:password])
            session[:instructor_id] = @instructor.id
            redirect_to instructor_path(@instructor)
        else
            render :new
        end
      end 

    def new 

    end 

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end
