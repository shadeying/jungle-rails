class User < ActiveRecord::Base

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }
  has_many :reviews
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    new_email = email.remove(' ').downcase
    if user = self.find_by(email: new_email).try(:authenticate, password)
      user
    end
  end

end
