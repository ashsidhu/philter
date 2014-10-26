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
    @new_product = Product.create(params[:products])
    # binding.pry
  end
end
