class EventsController < ApplicationController
  
  before_filter :set_headers
  respond_to :json
   
  def index
  end

  # initiates creation of event
  def create
    @event = Event.create(event_params)

    # checking necessary fields
    if !event_params[:name]
      render json: {success: false, message: "Error: missing name field"}, status:422
      return
    end
    if !event_params[:property1]
      render json: {success: false, message: "Error: missing property1 field"}, status:422
      return
    end
    if !event_params[:property2]
      render json: {success: false, message: "Error: missing property2 field"}, status:422
      return
    end
    if !event_params[:created_on]
      render json: {success: false, message: "Error: missing created_on field"}, status:422
      return
    end
    if !event_params[:created_at]
      render json: {success: false, message: "Error: missing created_at field"}, status:422
      return
    end
    if !request.referer 
      render json: {success: false, message: "Error: missing referer field"}, status:422
      return
    end
    if !request.domain
      render json: {success: false, message: "Error: missing domain field"}, status:422
      return
    end
    
    @event.referer_URL = request.referer
    @event.domain = request.domain
    
    if @event.save!

      render json: {success: true, message: "Event saved!"}, status:200
      return

    else
      render json: {success: false, message: "Error: unable to store. Try again"}, status:422
      return
    end

  end

  private

    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Content-Type'
      headers['Access-Control-Max-Age'] = '1728000'
    end

    def event_params
      params.require(:event).permit(:name, :created_on, :created_at, :property1, :property2)
    end
end