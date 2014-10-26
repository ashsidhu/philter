class PagesController < ApplicationController
  def home
    @products = Product.limit(50)
  end
end
