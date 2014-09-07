class DriverSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :rating, :alert, :token
  has_many :readings
end
