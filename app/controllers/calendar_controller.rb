class CalendarController < ApplicationController

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end
  
end
