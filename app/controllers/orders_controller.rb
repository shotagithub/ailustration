class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_find_product, only: [:index, :create]
  
  def index
    if user_signed_in? && current_user.id == @product.user_id
      redirect_to root_path
    end
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    if @order.valid?
      payment
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_find_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.permit().merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def payment
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
