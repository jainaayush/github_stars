class Repository
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :stars, type: Integer
  field :username, type: String

  # index({ name: 1 }, { unique: true, name: "name_index" })
end
