class CalendarController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.for_calendar(current_user)
    @user = current_user

  end
end