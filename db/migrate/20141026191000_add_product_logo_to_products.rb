class AddProductLogoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_logo, :string
  end
end
