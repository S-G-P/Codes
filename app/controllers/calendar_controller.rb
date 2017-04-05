class CalendarController < ApplicationController

  API_KEY = "b6ee02246df0875f4546f856083cadea"
  BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"
  CITY_ID = "1850147" #TOKYO

  # GET /schedules
  # GET /schedules.json
  def index
    @Weathers = get_weather_json
    @schedules = Schedule.all
  end
  
  private 
     # OpenWeatherMap API
    def get_weather_json
      require "json"
      require "open-uri"
      
      response = open(BASE_URL + "?id=#{CITY_ID}&APPID=#{API_KEY}")
      json_request = JSON.parse(response.read)
      
      return json_request
    end
end
