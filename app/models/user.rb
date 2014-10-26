class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :user_name, :upvotes_count, :name, :score, :followers_count, :comments_count, :password, :email
end
