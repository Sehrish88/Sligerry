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
     
    def facebook_login
        @instructor = Instructor.find_or_create_by(email: auth["info"]["email"])
        #if instructor doesn't have password then it obviously doesn't have a name
        if !@instructor.password 
            @instructor.password = SecureRandom.hex 
            @instructor.name = auth["info"]["name"]
        
            #checking the instruction is created properly
            if @instructor.save 
                session[:instructor_id] = @instructor.id 
                #byebug 
               
            else
                redirect '/'
            end 

        end
        redirect_to instructor_path(@instructor)

    end 
     



    def destroy
        session.delete :instructor_id
        redirect_to '/'
    end

    private 

    def auth 
        request.env["omniauth.auth"]
    end 


end
