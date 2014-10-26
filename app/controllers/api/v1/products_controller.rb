class Api::V1::ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.json { render json: @product }
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
end
