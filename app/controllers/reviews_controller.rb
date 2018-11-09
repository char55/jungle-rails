class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @review = Review.new(
        rating: params[:review][:rating],
        description: params[:review][:description],
        user_id: current_user.id,
        product_id: params[:product_id]
      )

      if @review.save
        puts [:products]
        redirect_to :back , notice: 'Product created!'
      else
        render :create
      end
  end

  def edit_review

  end
end
