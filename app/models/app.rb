class App
  include Mongoid::Document
  embeds_many :events
  before_create do |doc|
    doc.api_key = doc.generate_api_key
  end

  field :application_name,              type: String, default: ""
  field :application_host,              type: String, default: ""
  field :api_key                        type: String, default: ""

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless App.exists?(api_key: token).any?
    end
  end

end
