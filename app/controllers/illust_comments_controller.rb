class IllustCommentsController < ApplicationController
  def create
    IllustComment.create(comment_params)
    redirect_to illust_path(params[:illust_id])
  end

  private
  def comment_params
    params.require(:illust_comment).permit(:text).merge(user_id: current_user.id, illust_id: params[:illust_id])
  end
end
