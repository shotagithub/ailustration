require 'rails_helper'
# bundle exec rspec spec/models/novel_spec.rb
# 要custom validate 対応
RSpec.describe Novel, type: :model do
  before do
    @novel = FactoryBot.build(:novel)
  end

  describe 'イラストの新規投稿' do
    
    context '新規投稿できる場合' do
      it 'title,contentが存在すれば登録できる' do
        expect(@novel).to be_valid
      end


      it 'applicationが空でも投稿できる' do
        @novel.application = ""
        expect(@novel).to be_valid
      end
    end
  

    context '新規投稿できない場合' do

      it 'ユーザーが紐づいていなければ投稿できない' do
        @novel.user = nil
        @novel.valid?
        expect(@novel.errors.full_messages).to include('User must exist')
      end

      it 'titleが空では投稿できない' do
        @novel.title = ""
        @novel.valid?
        expect(@novel.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空では投稿できない' do
        @novel.content = ""
        @novel.valid?
        expect(@novel.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end
