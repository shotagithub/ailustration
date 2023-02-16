class IllustsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :set_find, only: [:show, :destroy]

  def index
    @illust = Illust.includes(:user).limit(10).order("created_at DESC")
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
  end

  def destroy
    @illust.destroy if user_signed_in? && current_user.id == @illust.user.id
    redirect_to root_path
  end

  private
  def illust_params
    params.require(:illust).permit(:title, :description, :application, :prompt, {images: []}).merge(user_id: current_user.id)
  end

  def set_find
    @illust = Illust.find(params[:id])
  end

end
