class Reading < ActiveRecord::Base
  belongs_to :driver

  validates :speed,
    presence: true

  validates :rpm,
    presence: true

  validates :odometer,
    presence: true

  validates :longitude,
    presence: true,
    numericality: { greater_than: -180, less_than: 180 }
    
  validates :latitude,
    presence: true,
    numericality: { greater_than:  -90, less_than:  90 }

  validates :timestamp,
    presence: true
end
