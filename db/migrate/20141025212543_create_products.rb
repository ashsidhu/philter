class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :tagline
      t.integer :product_type
      t.string :product_url
      t.integer :user_id
      t.integer :category_id
      t.string :linked_in_url
      t.string :crunchbase_url
      t.string :location
      t.string :screenshot_url
      t.boolean :approved

      t.timestamps
    end
  end
end
