class Driver < ActiveRecord::Base
  before_create :generate_token
  
  belongs_to :manager
  has_many :readings
  has_many :locations

  def generate_token
    self.token = SecureRandom.hex(2)
  end
end
