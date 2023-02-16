class IllustsController < ApplicationController

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
    @illust = Illust.find(params[:id])
  end

  private
  def illust_params
    params.require(:illust).permit(:title, :description, :application, :prompt, {images: []}).merge(user_id: current_user.id)
  end
end
