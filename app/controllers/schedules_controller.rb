class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  API_KEY = "b6ee02246df0875f4546f856083cadea"
  BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"
  CITY_ID = "1850147" #TOKYO

  # GET /schedules
  # GET /schedules.json
  def index
    @Weathers = get_weather_json
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
    @users = User.all
    @users.each do |user|
      if @schedule.schedule_users.find_by(user_id: user.id).nil?
        @schedule.schedule_users.build(user_id: user.id) #招待できるユーザIDを含めてオブジェクトを生成する
      end
    end
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:title, :date_from, :date_to, :place, :content, schedule_users_attributes: [:id, :schedule_id, :user_id])
    end

    # OpenWeatherMap API
    def get_weather_json
      require "json"
      require "open-uri"
      
      response = open(BASE_URL + "?id=#{CITY_ID}&APPID=#{API_KEY}")
      json_request = JSON.parse(response.read)
      
      return json_request
    end
end
