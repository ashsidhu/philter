class ProductsController < ApplicationController
  def index
    @products_all = Product.all
    @new_product = Product.new

      respond_to do |format|
      format.html
      format.json {render :json => @products_all}
    end
  end

  def new
    @product = Product.new(params[:product])
    if @product.save
      redirect_to "/products"
    end
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

end
