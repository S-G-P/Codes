class CalendarController < ApplicationController
  def show
     @schedules = Schedule.all
  end
end
