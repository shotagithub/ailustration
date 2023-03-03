class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @user = user.nickname
    @illust = user.illusts.limit(5).order(created_at: 'desc')
    @novel = user.novels.limit(5).order(created_at: 'desc')
    @product = user.products.limit(5).order(created_at: 'desc')
  end

  def show_all
    user = User.find(params[:id])
    @user = user.nickname
    @illust = user.illusts.limit(20).order(created_at: 'desc')
    @novel = user.novels.limit(20).order(created_at: 'desc')
    @product = user.products.limit(20).order(created_at: 'desc')
  end
 
end
