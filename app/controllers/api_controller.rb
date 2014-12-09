class ApiController < ApplicationController

  private
 
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @app = App.where(api_key: token).first
    end
  end

end
