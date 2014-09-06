class DriverSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :token
  has_many :readings
end
