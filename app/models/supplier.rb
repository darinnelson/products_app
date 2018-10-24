class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :phone_number, presence: true
  validates :phone_number, uniqueness: true

  def product
    Product.find_by(supplier_id: id)
  end
end
