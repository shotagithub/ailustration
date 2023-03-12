class IllustsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit, :update, :destroy, :search]
  before_action :set_find, only: [:show, :edit, :update, :destroy]

  def index
    @illust = Illust.includes(:user).limit(10).order("created_at DESC")
    @ranking = Illust.find(IllustLike.group(:illust_id).limit(10).order('count(illust_id) desc').pluck(:illust_id))
  end
  
  def new
    @illust = Illust.new
  end

  def create
    @illust = Illust.new(illust_params)
    if @illust.save
      redirect_to illust_path(@illust.id)
    else
      render :new
    end
  end

  def show
    @comment = IllustComment.new
    @comments = @illust.illust_comments.includes(:user)
    @like_count = IllustLike.where(illust_id: @illust.id).count
  end

  def edit
    if user_signed_in? && @illust.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @illust.update(illust_params)
    if @illust.save
      redirect_to illust_path
    else
      render :edit
    end
  end

  def destroy
    @illust.destroy if user_signed_in? && current_user.id == @illust.user.id
    redirect_to root_path
  end

  def search
    @illust = Illust.search(params[:keyword]).page(params[:page]).order(created_at: 'desc')
  end


  
  private
  def illust_params
    params.require(:illust).permit(:title, :description, :application, :prompt, {images: []}).merge(user_id: current_user.id)
  end

  def set_find
    @illust = Illust.find(params[:id])
  end

end
