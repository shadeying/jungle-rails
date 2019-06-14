class User < ActiveRecord::Base

  validates :first_name, :email, :password, presence: true
  validates :email, uniqueness: true
  has_many :reviews
  has_secure_password

end
