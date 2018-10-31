class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all.order(:id)

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
    
    if params[:name_input]
      @products = @products.where(name: params[:name_input])
    end

    render "index.json.jbuilder"

  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      user_id: current_user.id
      )
    
    if @product.save
      Image.create(
        image_url: params[:image_url],
        product_id: @product.id
      )
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.id = params[:id] ||  @product.id
    @product.name = params[:name] ||  @product.name
    @product.price = params[:price] ||  @product.price
    @product.description = params[:description] ||  @product.description

    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product successfully destroy"}
  end

end
