require 'rails_helper'
# bundle exec rspec spec/models/product_spec.rb
# 要custom validate 対応
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe 'イラストの新規投稿' do
    
    context '新規投稿できる場合' do
      it 'images, file, title, description, application, priceが存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end
  

    context '新規投稿できない場合' do

      it 'ユーザーが紐づいていなければ投稿できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end

      it 'imagesが空では登録できない' do
        @product.images = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Images can't be blank")
      end

      it 'fileが空では登録できない' do
        @product.file = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("File can't be blank")
      end

      it 'titleが空では登録できない' do
        @product.title = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @product.description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'applicationが空では登録できない' do
        @product.application = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Application can't be blank")
      end

      it 'priceが空では登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが100円以下では登録できない' do
        @product.price = 99
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 100")
      end

      it 'priceが100000円以上では登録できない' do
        @product.price = 100000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 99999")
      end
      
    end
  end
end
