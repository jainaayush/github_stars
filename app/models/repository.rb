class Repository
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :name, type: String
  field :stars, type: Integer
end

