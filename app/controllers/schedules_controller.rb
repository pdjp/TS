class SchedulesController < ApplicationController
  before_action :authenticate_user
  def index
    @schedules = Schedule.all
  end
  def show
    @schedule=Schedule.find_by(id:params[:id])
    @user = User.find_by(id: @schedule.user_id)
  end  
  def new
    @schedule = Schedule.new
  end
  def create
    @schedule = Schedule.new(
      content: params[:content],
      user_id: @current_user.id
    )
    if @schedule.save 
      flash[:notice] = "作成しました"
      redirect_to("/index")    
    else
      render("schedules/new")
    end  
  end  
  def edit
    @schedule = Schedule.find_by(id: params[:id])
  end
  def update
    @schedule = Schedule.find_by(id: params[:id])
    @schedule.content = params[:content]
    if @schedule.save
      flash[:notice] = "編集しました"
      redirect_to("/index")
    else
      render("schedules/edit")
    end  
  end
  def destroy
    @schedule = Schedule.find_by(id: params[:id])
    @schedule.destroy
    flash[:notice] = "削除しました"
    redirect_to("/index")
  end
end
