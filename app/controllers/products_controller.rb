class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(name: params[:product][:name], price: params[:product][:price].to_i, description: params[:product][:description], inventory: params[:product][:inventory].to_i)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def description
    @product = Product.find_by(id: params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find_by(id: params[:id])
    if !!(@product.inventory) && @product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

end
