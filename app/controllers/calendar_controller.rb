class CalendarController < ApplicationController
    def index
        @events = Event.all
        @user = User.first

    end        
end    