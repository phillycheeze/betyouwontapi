class Driver < ActiveRecord::Base
  before_create :generate_token
  
  belongs_to :manager
  has_many :readings

  def self.alerts
    ['Speeding', 'Crash']
  end

  validates :name,
    presence: true

  def generate_token
    self.token = SecureRandom.hex(2)
  end
end
