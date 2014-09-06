class Manager < ActiveRecord::Base
  has_secure_password
  
  has_many :drivers

  before_save { email.downcase!}

  validates :email, :full_name,
    presence: true,
    uniqueness: { case_sensitive: false }

  validates(:email, format: /\A.+@.+\Z/)
end
