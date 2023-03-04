class UsersController < ApplicationController

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
 
end
