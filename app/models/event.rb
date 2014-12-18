class Event
  include Mongoid::Document

  field :name,                  type: String, default: ""
  field :property1,             type: String, default: ""
  field :property2,             type: String, default: ""
  field :referer_URL,           type: String, default: ""
  field :domain,           type: String, default: ""
  field :created_on,            type: Date, default: Date.today
  field :created_at,            type: Time, default: Time.now
  belongs_to :user

end