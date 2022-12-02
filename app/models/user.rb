class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :repositories

  field :username, type: String
end
