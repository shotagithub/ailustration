class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @user = user.nickname
    @illust = user.illusts.page(params[:page]).order(created_at: 'desc')
    @novel = user.novels.page(params[:page]).order(created_at: 'desc')
    @product = user.products.page(params[:page]).order(created_at: 'desc')
  end
 
end
