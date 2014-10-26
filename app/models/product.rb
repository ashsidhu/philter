class Product < ActiveRecord::Base
  #add author_id
  validates :name, uniqueness: true
end
