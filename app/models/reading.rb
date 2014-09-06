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
end
