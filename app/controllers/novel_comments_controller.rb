class NovelCommentsController < ApplicationController
  def create
    NovelComment.create(comment_params)
    redirect_to novel_path(params[:novel_id])
  end

  private
  def comment_params
    params.require(:novel_comment).permit(:text).merge(user_id: current_user.id, novel_id: params[:novel_id])
  end
end
