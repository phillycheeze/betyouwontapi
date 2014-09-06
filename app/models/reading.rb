class Reading < ActiveRecord::Base
  belongs_to :driver

  def self.names 
    [
      'Odometer',
      'VehicleSpeed',
      'EngineSpeed'
    ]
  end

  validates :value,
    presence: true

  validates :name,
    presence: true,
    inclusion: names

  validates :timestamp,
    presence: true
end
