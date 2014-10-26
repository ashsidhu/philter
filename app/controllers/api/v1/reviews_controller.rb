class Api::V1::ReviewsController < ApplicationController
  def create
    user_id = signed_in? ? current_user.id : "1"
    @review = Review.create(params[:review].merge!(user_id: user_id))
    if @review.save
      render json: { success: true }
    else
      render json: {success: false, errors: @review.errors.full_messages.to_s }
    end
  end
end
