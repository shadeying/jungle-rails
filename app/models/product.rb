class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def overall_rating
    rating = 0
    if self.reviews.size == 0
      return 0
    else
      self.reviews.each do |review|
        rating += review.rating
      end
      return rating / self.reviews.size
    end
  end

end
