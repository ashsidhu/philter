class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.references :product, index: true
      t.boolean :liked

      t.timestamps
    end
  end
end
