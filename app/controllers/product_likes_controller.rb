class ProductLikesController < ApplicationController
  def create
    @product_like = ProductLike.new(user_id: current_user.id, product_id: params[:product_id])
    @product_like.save
    redirect_to product_path(params[:product_id])
  end

  def destroy
    @product_like = ProductLike.find_by(user_id: current_user.id, product_id: params[:product_id])
    @product_like.destroy
    redirect_to product_path(params[:product_id])
  end
end
