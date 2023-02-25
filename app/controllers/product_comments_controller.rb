class ProductCommentsController < ApplicationController
  def create
    ProductComment.create(comment_params)
    redirect_to product_path(params[:product_id])
  end

  private
  def comment_params
    params.require(:product_comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
