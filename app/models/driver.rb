class Driver < ActiveRecord::Base
  before_create :generate_token
  
  belongs_to :manager
  has_many :readings

  def generate_token
    self.token = SecureRandom.hex(4)
  end
end
