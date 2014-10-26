class Review < ActiveRecord::Base
  belongs_to :product
    attr_accessible :liked, :user_id
  # belongs_to :user
end
