class NovelsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_find, only: [:show, :edit, :update, :destroy]

  def index
    @novel = Novel.includes(:user).limit(10).order("created_at DESC")
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
  end

  def edit
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
