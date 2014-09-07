class ReadingSerializer < ActiveModel::Serializer
  attributes :id,
    :odometer,
    :speed,
    :rpm,
    :longitude,
    :latitude,
    :timestamp
end
