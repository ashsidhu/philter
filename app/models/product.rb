class Product < ActiveRecord::Base
  attr_accessible :name, :tagline, :product_type, :product_url, :linked_in_url, :crunchbase_url, :location, :screenshot_url
  #add author_id
  validates :name, uniqueness: true
end
