class SchedulesController < ApplicationController

    def new 
        @schedule = Schedule.new 

    end 

    def show
        @achedule = Schedule.find_by(id: params[:id])

    end 

    def create 
        @schedule = Schedule.new(schedule_params)
        if @schedule.save
            redirect_to schedule_path(@schedule)
        else
            render:new
        end 


    private

    def schedule_params
        params.require(:schedule).permit(:days, :time, :semester)
    end 
end
