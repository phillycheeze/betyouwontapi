class Reading < ActiveRecord::Base
  belongs_to :driver

  def self.values 
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
    inclusion: values

  validates :timestamp,
    presence: true
end
