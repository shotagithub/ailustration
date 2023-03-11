class IllustLikesController < ApplicationController

  def create
    @illust_like = Illust_like.new(user_id: current_user.id, illust_id: params[:post_id])
    @illust_like.save
    redirect_to illust_path(params[:illust_id])
  end

  def destroy
    @illust_like = Illust_like.find_by(user_id: current_user.id, illust_id: params[:post_id])
    @illust_like.destroy
    redirect_to illust_path(params[:illust_id])
  end

  private

  def pushed_like?(user)
    illust_likes.where(user_id: user.id).exist?
  end

end