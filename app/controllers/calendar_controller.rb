class CalendarController < ApplicationController

  API_KEY = "b6ee02246df0875f4546f856083cadea"
  BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"
  CITY_ID = "1850147" #TOKYO
  
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]  
  before_action :authenticate_user!
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # GET /calendar
  def index
    @schedules = current_user.schedules.all
    @Weathers = get_weather_json
  end
  
  # GET /calendar/to_json
  def index_json
    schedules = current_user.schedules.all
    render :json => schedules
  end

  private 
     # OpenWeatherMap API
    def get_weather_json
      @location = Location.find_by(user_id: current_user.id)
      if @location == nil
        # tokyo
        lat = 35
        lon = 139
      else
        lat = @location.latitude
        lon = @location.longitude
      end
      require "json"
      require "open-uri"
      response = open(BASE_URL + "?lat=#{lat}&lon=#{lon}&APPID=#{API_KEY}")
      json_request = JSON.parse(response.read)
      
      return json_request
    end
      
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = current_user.schedules.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:title, :date_from, :date_to, :place, :content, :user_id, schedule_users_attributes: [:id, :schedule_id, :user_id])
    end
    
end
