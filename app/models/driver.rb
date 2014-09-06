class Driver < ActiveRecord::Base
  belongs_to :manager
  has_many :readings
end
