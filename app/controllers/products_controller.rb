class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_find, only: [:show, :edit, :update, :destroy]

  def index
    @product = Product.includes(:user).limit(10).order("created_at DESC")
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy if user_signed_in? && current_user.id == @product.user.id
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:title, :proce, :description, :application).merge(user_id: current_user.id)
  end

  def set_find
    @product = Product.find(params[:id])
  end
end
