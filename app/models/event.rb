class Event
  include Mongoid::Document

  field :username,              type: String, default: ""
  field :ocurred_at,            type: Time

end