require "rails_helper"

describe Event do

  it "has a valid factory" do
    @event = expect(create(:event)).to be_valid
  end

  it "is invalid without a referer" do
    @event = expect(build(:event, referer_URL: nil)).to be_invalid
  end

  it "is invalid without a user" do
    @event = expect(build(:event, user: nil)).to be_invalid
  end

  it "is invalid without a created_on" do
    @event = expect(build(:event, created_on: nil)).to be_invalid
  end

  it "is invalid without a property1" do
    @event = expect(build(:event, property1: nil)).to be_invalid
  end

  it "is invalid without a property2" do
    @event = expect(build(:event, property2: nil)).to be_invalid
  end

  describe "scopes" do
    before do
      @user = create(:user)
      @old = create(:event, date: Date.new(2001,1,1), user: @user)
      @middle = create(:event, date: Date.new(2008,1,1), user: @user)
      @recent = create(:event, date: Date.new(2014,1,1), user: @user)
    end

    describe "by_date" do
      it "returns a set of events sorted by date from earliest to most recent" do
       expect(@user.events.by_date).to == [@old, @middle, @recent]
      end
    end

  end

end