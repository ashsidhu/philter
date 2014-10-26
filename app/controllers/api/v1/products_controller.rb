class Api::V1::ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.json { render json: @product }
    end
  end

  def create
  end
end
