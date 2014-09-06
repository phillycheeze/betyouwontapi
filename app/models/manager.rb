class Manager < ActiveRecord::Base
  has_secure_password
  before_create :generate_token

  has_many :drivers

  before_save { email.downcase!}

  validates :email, :full_name,
    presence: true,
    uniqueness: { case_sensitive: false }

  validates(:email, format: /\A.+@.+\Z/)

  def generate_token
    self.authentication_token = SecureRandom.hex(4)
  end

  def auth_token
    authentication_token || regenerate_auth_token
  end

  def regenerate_auth_token
    begin
      self.authentication_token = SecureRandom.hex
    end while self.class.exists?(authentication_token: authentication_token)
    authentication_token
  end
end
