class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :show_all_illusts, :show_all_novels, :show_all_products, :edit, :update]

  def show
    user = User.find(params[:id])
    @user = user.nickname
    @illust = user.illusts.limit(5).order(created_at: 'desc')
    @novel = user.novels.limit(5).order(created_at: 'desc')
    @product = user.products.limit(5).order(created_at: 'desc')
  end

  def show_all_illusts
    user = User.find(params[:id])
    @user = user.nickname
    @illust = user.illusts.page(params[:page]).order(created_at: 'desc')
  end

  def show_all_novels
    user = User.find(params[:id])
    @user = user.nickname
    @novel = user.novels.page(params[:page]).order(created_at: 'desc')
  end

  def show_all_products
    user = User.find(params[:id])
    @user = user.nickname
    @product = user.products.page(params[:page]).order(created_at: 'desc')
  end

  def edit
  end


  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :nickname, :prefecture, :municipality, :address, :building)
  end

end
