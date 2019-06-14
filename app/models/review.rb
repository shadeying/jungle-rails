class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates_associated :product
  validates_presence_of :product
  validates_associated :user
  validates_presence_of :user
  validates :rating, :description, presence: true
  validates :rating, numericality:{ only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end
