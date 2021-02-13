class SchedulesController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  def index
    @schedules = Schedule.all.order(date: :asc)
  end
  def show
    @schedule=Schedule.find_by(id:params[:id])
    @user = @schedule.user
  end  
  def new
    @schedule = Schedule.new
  end
  def create
    @schedule = Schedule.new(
      date: params[:date],
      content: params[:content],
      user_id: @current_user.id,
      money: params[:money]
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
    @schedule.date = params[:date]
    @schedule.content = params[:content]
    @schedule.money = params[:money]
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
  def ensure_correct_user
    @schedule = Schedule.find_by(id: params[:id])
    if @schedule.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/index")
    end
  end
end
