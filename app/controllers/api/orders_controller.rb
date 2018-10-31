class Api::OrdersController < ApplicationController
  before_action :authenticate_user #except: :index

  def index
      @orders = Order.all
      render "index.json.jbuilder"
  end

  def create
    @carted_products = CartedProduct.where(status: "carted")
    subtotal = 0
    @carted_products.each do |carted_product|
      quantity = carted_product.quantity
      price = carted_product.product.price
      indiv_price = quantity * price
      subtotal += indiv_price
    # @order_subtotal += @carted_product.quantity.to_i * @carted_product.price.to_i
    end

    tax = subtotal * 0.09

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: subtotal + tax
    )
    @order.save
    @carted_products.each do |x|
      x.status = "purchased"
      x.order_id = @order.id
      x.save
    end
    render "show.json.jbuilder"
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    @order.destroy
    render json: {message: "Order successfully removed"}
  end

end
