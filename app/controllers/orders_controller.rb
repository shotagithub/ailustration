class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_find_product, only: [:index, :create]
  
  def index
    if user_signed_in? && current_user.id == @product.user.id || !@product.order.nil?
      redirect_to root_path
    end
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
  end

  private
  def set_find_product
    @product = Product.find(params[:product_id])
  end
  def order_params
    params.merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end
end
