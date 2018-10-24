class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    
    if params[:name_input]
      @suppliers = @suppliers.where(name: params[:name_input])
    end

    render "index.json.jbuilder"
  end

  def create
    @supplier = Supplier.new(
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"]
      )

    if @supplier.save
      render "show.json.jbuilder"
    else
      render json: {errors: @supplier.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.id = params[:id] ||  @supplier.id
    @supplier.name = params[:name] ||  @supplier.name
    @supplier.email = params[:email] ||  @supplier.email
    @supplier.phone_number = params[:phone_number] ||  @supplier.phone_number

    if @supplier.save
      render "show.json.jbuilder"
    else
      render json: {errors: @supplier.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  def destroy
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.destroy
    render json: {message: "Supplier successfully destroy"}
  end
end
