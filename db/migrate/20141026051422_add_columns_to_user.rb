class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :user_name, :string
    add_column :users, :score, :float
    add_column :users, :upvotes_count, :integer
    add_column :users, :followers_count, :integer
    add_column :users, :comments_count, :integer
  end
end
