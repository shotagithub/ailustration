class NovelsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :show, :edit, :update, :destroy, :search]
  before_action :set_find, only: [:show, :edit, :update, :destroy]

  def index
    @novel = Novel.includes(:user).limit(10).order("created_at DESC")
    @ranking = Novel.find(NovelLike.group(:novel_id).limit(10).order('count(novel_id) desc').pluck(:novel_id))
  end
  
  def new
    @novel = Novel.new
  end

  def create
    @novel = Novel.new(novel_params)
    if @novel.save
      redirect_to novel_path(@novel.id)
    else
      render :new
    end
  end

  def show
    @comment = NovelComment.new
    @comments = @novel.novel_comments.includes(:user)
    @like_count = NovelLike.where(novel_id: @novel.id).count
  end

  def edit
    if user_signed_in? && @novel.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @novel.update(novel_params)
    if @novel.save
      redirect_to novel_path
    else
      render :edit
    end
  end

  def destroy
    @novel.destroy if user_signed_in? && current_user.id == @novel.user.id
    redirect_to root_path
  end

  def search
    @novel = Novel.search(params[:keyword]).page(params[:page]).order(created_at: 'desc')
  end

  private
  def novel_params
    params.require(:novel).permit(:title, :application, :content).merge(user_id: current_user.id)
  end

  def set_find
    @novel = Novel.find(params[:id])
  end

end
