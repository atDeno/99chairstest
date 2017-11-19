class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
  field :count, type: Integer, default: 1
  field :last_name, type: String

  validates :first_name, presence: true
end
