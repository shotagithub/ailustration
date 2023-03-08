require 'rails_helper'
# bundle exec rspec spec/models/illust_spec.rb
RSpec.describe Illust, type: :model do

  before do
    @illust = FactoryBot.build(:illust)
  end

  describe 'イラストの新規投稿' do
    
    context '新規投稿できる場合' do
      it 'image,title,description,applicationが存在すれば登録できる' do
        expect(@illust).to be_valid
      end

      it 'promptが空でも投稿できる' do
        @illust.prompt = ''
        expect(@illust).to be_valid
      end
    end
  

    context '新規投稿できない場合' do

      it 'ユーザーが紐づいていなければ投稿できない' do
        @illust.user = nil
        @illust.valid?
        expect(@illust.errors.full_messages).to include('User must exist')
      end

      it 'imageが空では投稿できない' do
        @illust.images = nil
        @illust.valid?
        expect(@illust.errors.full_messages).to include("Images can't be blank")
      end

      it 'imagesがpng,jpg,jpeg形式以外では投稿できない' do
        @illust.images[0] = fixture_file_upload('public/images/test.zip')
        @illust.valid?
        expect(@illust.errors.full_messages).to include("Images の拡張子が間違っています")
      end

      it 'titleが空では投稿できない' do
        @illust.title = ""
        @illust.valid?
        expect(@illust.errors.full_messages).to include("Title can't be blank")
      end

      it 'descriptionが空では投稿できない' do
        @illust.description = ""
        @illust.valid?
        expect(@illust.errors.full_messages).to include("Description can't be blank")
      end

      it 'applicationが空では投稿できない' do
        @illust.application = ""
        @illust.valid?
        expect(@illust.errors.full_messages).to include("Application can't be blank")
      end
    end
  end
end
