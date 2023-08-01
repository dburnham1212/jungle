class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true 
  validates :price_cents, numericality: { greater_than: 0 }

  # Check if the product is in stock
  def in_stock?
    quantity > 0
  end
end
