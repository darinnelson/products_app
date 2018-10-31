class Api::CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.all
    # @carted_products = CartedProduct.where(status: "carted")
    # @carted_products = CartedProduct.where(status: "purchased")
    render "index.json.jbuilder"
  end
  
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: "carted",
    )
    @carted_product.save
    render "show.json.jbuilder"
  end

  def show
    @carted_product = CartedProduct.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  # def update 
  #   @carted_product = CartedProduct.find_by(id: params[:id])
  #   @carted_product.user_id = current_used.id
  #   @carted_product.quantity = params[:quantity] || @carted_product.quantity
  #   @carted_product.status = params[:status] || @carted_product.status
  #   if @carted_product.status == "purchased"
  #     @carted_product.order_id = @carted_product.order_id
  #   end
  # end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.status = "removed"
    @carted_product.save
    render "show.json.jbuilder"
  end

end
