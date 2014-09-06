class Reading < ActiveRecord::Base
  belongs_to :driver

  def self.values 
    [
      'EngRPM',
      'ODO',
      'VEH_SPEED',
      'VehAccel_X'
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
