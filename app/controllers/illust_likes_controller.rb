class IllustLikesController < ApplicationController

  def create
    @illust_like = IllustLike.new(user_id: current_user.id, illust_id: params[:illust_id])
    @illust_like.save
    redirect_to illust_path(params[:illust_id])
  end

  def destroy
    @illust_like = IllustLike.find_by(user_id: current_user.id, illust_id: params[:illust_id])
    @illust_like.destroy
    redirect_to illust_path(params[:illust_id])
  end

end