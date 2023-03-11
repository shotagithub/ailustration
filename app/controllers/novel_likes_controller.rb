class NovelLikesController < ApplicationController
  def create
    @novel_like = NovelLike.new(user_id: current_user.id, novel_id: params[:novel_id])
    @novel_like.save
    redirect_to novel_path(params[:novel_id])
  end

  def destroy
    @novel_like = NovelLike.find_by(user_id: current_user.id, novel_id: params[:novel_id])
    @novel_like.destroy
    redirect_to novel_path(params[:novel_id])
  end
end
