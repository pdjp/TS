class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  def show
    @schedule=Schedule.find_by(id:params[:id])
  end  
  def new
  end
  def create
    @schedule = Schedule.new(content: params[:content])
    @schedule.save 
    redirect_to("/index")
  end  
  def edit
    @schedule = Schedule.find_by(id: params[:id])
  end
  def update
    @schedule = Schedule.find_by(id: params[:id])
    @schedule.content = params[:content]
    @schedule.save
    redirect_to("/index")
  end
  def destroy
    @schedule = Schedule.find_by(id: params[:id])
    @schedule.destroy
    redirect_to("/index")
  end
end
