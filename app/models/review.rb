class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates_associated :product
  validates_presence_of :product

  validates_associated :user
  validates_presence_of :user

end
