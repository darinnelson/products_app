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

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def image
    Image.where(product_id: id)
  end

 has_many :orders



end
