class ScheduleUsersController < ApplicationController
  
  # POST /schedules
  # POST /schedules.json
  def create
    @schedule_user = ScheduleUser.new(schedule_user_params)
    if @schedule_user.save
      redirect_to schedule_path(@schedule_user.schedule_id), notice: "( ^ω^ )参加ユーザーを登録しました。"
    else
      render 'new'
    end
  end
  
   private
   
    def schedule_user_params
      params.require(:schedule_user).permit(:schedule_id, :user_id)
    end
    
end