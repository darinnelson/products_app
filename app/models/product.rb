class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: { in: 1..100000}

  def is_discounted?
    price < 25
  end

  def tax
    return price * 0.09
  end

  def total
    return price + tax
  end

  # belongs_to :supplier
  def supplier
    Supplier.find_by(id: supplier_id)
  end

  has_many :images
  # def image
  #   Image.where(product_id: id)
  # end

  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products 
  # def categories
  #   category_products.map {|category_product| catergory_product.category}
  has_many :carted_products
  # end
end
