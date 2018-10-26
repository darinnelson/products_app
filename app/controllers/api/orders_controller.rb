class Api::OrdersController < ApplicationController
  before_action :authenticate_user #except: :index

  def index
      @orders = current_user.orders
      render "index.json.jbuilder"
  end

  def create
    product = Product.find_by(id: params[:product_id])
    @order = Order.new(
      user_id: current_user.id,
      product_id: product.id,
      quantity: params[:quantity].to_i,
      subtotal: params[:quantity].to_i * product.price,
      tax: params[:quantity].to_i * product.tax,
      total: product.total * params[:quantity].to_i
    )
    @order.save
    render "show.json.jbuilder"
  end

end
