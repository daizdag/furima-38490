require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '新規登録できるとき' do
      it 'name,content,category_id,state_id,deliverycharge_id,sender_id,scheduleddelivery_id,price,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'contentが空では登録できない' do
        @item.content = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end
      it 'categoryが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category を入力してください"
      end
      it 'stateが空では登録できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "State を入力してください"
      end
      it 'deliverychargeが空では登録できない' do
        @item.deliverycharge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Deliverycharge を入力してください"
      end
      it 'senderが空では登録できない' do
        @item.sender_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Sender を入力してください"
      end
      it 'scheduleddeliveryが空では登録できない' do
        @item.scheduleddelivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduleddelivery を入力してください"
      end
      it 'priceが空では登録できない' do
        @item.price = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300円未満では登録できない' do
        @item.price = 299  
        @item.valid?
        expect(@item.errors.full_messages).to include "Price が設定範囲外です"
      end
      it 'priceが9_999_999円以上では登録できない' do
        @item.price = 99999999  
        @item.valid?
        expect(@item.errors.full_messages).to include "Price が設定範囲外です"
      end
      it 'priceは全角では登録できない' do
        @item.price = '４０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price 価格は半角文字入力してください"
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
