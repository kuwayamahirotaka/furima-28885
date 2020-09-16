require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '出品登録がうまくいくとき' do
      it "imageとname、show、category_id、status_id、
      transfee_id、transregion_id,transdate_id,priceが存在すれば登録できる" do
      expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image select")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name input")
      end
      it 'showが空だと登録できない' do
        @item.show = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Show input")
      end
      it 'category_idが--だと登録できない' do
        @item.category_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category select")
      end
      it 'status_idが--だと登録できない' do
        @item.status_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status select")
      end
      it 'transfee_idが--だと登録できない' do
        @item.transfee_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include("Transfee select")
      end
      it 'transregion_idが--だと登録できない' do
        @item.transregion_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include("Transregion select")
      end
      it 'transdate_idが--だと登録できない' do
        @item.transdate_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include("Transdate select")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300以上¥9,999,999以下でなければ登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Please input ¥300~¥9,999,999')
      end
    end
  end
end

