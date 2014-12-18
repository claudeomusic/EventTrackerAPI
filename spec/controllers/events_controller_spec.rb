require 'rails_helper'

describe EventsController do 

  before do
    @user = create(:user)
    sign_in @user
  end

  describe 'POST #create' do

    it "responds successfully with an HTTP 200 status code" do
      # how to tie user to event creation here?
      post :create
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "responds with JSON" do
      post :create
      expect(response).to have_content_type('application/json')
    end

    it "loads a new event into current users array of events for specified app" do
      before_count = @user.events.count
      post :create

      expect(@user.events.count).to eq(before_count + 1)

    end

    it "fails if timestamp isn't passed in body" do
      # how to ?
    end

  end

  describe 'POST #index' do

    it "responds with appropriate HTTP headers" do
      post :index

      expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      expect(response.headers['Access-Control-Allow-Methods']).to eq('POST, GET, OPTIONS')
      expect(response.headers['Access-Control-Allow-Headers']).to eq('Content-Type')
      expect(response.headers['Access-Control-Max-Age']).to eq(1728000)
    end
  end

end

