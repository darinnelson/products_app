class Order < ApplicationRecord
  # belongs_to :carted_products
  has_many :carted_products
  belongs_to :user
end
