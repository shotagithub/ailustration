class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :show, :edit, :update, :destroy, :search]
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
    products = @product.id
    user = current_user.id
    @order = Order.where(user_id: user).where(product_id: products)

    @comment = ProductComment.new
    @comments = @product.product_comments.includes(:user)
  end

  def edit
    if user_signed_in? && @product.user_id != current_user.id
      redirect_to root_path
    end
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

  def search
    @product = Product.search(params[:keyword]).page(params[:page]).order(created_at: 'desc')
  end

  private
  def product_params
    params.require(:product).permit(:title, :price, :description, :application, :file, {images: []}).merge(user_id: current_user.id)
  end

  def set_find
    @product = Product.find(params[:id])
  end
end
