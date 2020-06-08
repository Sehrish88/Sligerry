class SessionsController < ApplicationController

    def create
        @instructor = Instructor.find_by(email: params[:instructor][:email])
        #byebug
        if @instructor && @instructor.authenticate(params[:instructor][:password])
            session[:instructor_id] = @instructor.id
            redirect_to instructor_path(@instructor)
        else
            render :new
        end
      end 



    def destroy
        session.delete :instructor_id
        redirect_to '/'
    end
end
