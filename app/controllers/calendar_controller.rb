class CalendarController < ApplicationController
  def index
     @schedules = Schedule.all
  end
end
