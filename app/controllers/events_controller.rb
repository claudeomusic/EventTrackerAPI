class EventsController < ApplicationController
  respond_to :json
   
    def index
      @events = Event.all
      respond_with @events
    end

    # initiates creation of event
    def create

    end
end