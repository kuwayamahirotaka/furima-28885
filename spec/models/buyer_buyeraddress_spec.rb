require 'rails_helper'

RSpec.describe BuyerBuyeraddress, type: :model do
  describe '購入者情報の保存' do
    before do
      @buyer_buyeraddress = FactoryBot.build(:buyer_buyeraddress)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer_buyeraddress).to be_valid
    end
    it 'card-numberが空だと保存できないこと' do
      @buyer_buyeraddress.token = nil
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("Card-number can't be blank")
    end
    it 'card-cvcが空だと保存できないこと' do
      @buyer_buyeraddress.token = nil
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("Card-cvc can't be blank")
    end
    it 'card-monthが空だと保存できないこと' do
      @buyer_buyeraddress.token = nil
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("Card-month can't be blank")
    end
    it 'card-yearが空だと保存できないこと' do
      @buyer_buyeraddress.token = nil
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("Card-year can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @buyer_buyeraddress.postal_code = nil
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buyer_buyeraddress.postal_code = '1234567'
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @buyer_buyeraddress.prefecture = 0
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityは空だと保存できないこと' do
      @buyer_buyeraddress.city = nil
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("City can't be blank")
    end  
    it 'house_numberは空だと保存できないこと' do
      @buyer_buyeraddress.house_number = nil
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("House_number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @buyer_buyeraddress.building_name = nil
      expect(@buyer_buyeraddress).to be_valid
    end
    it 'phonenumberは空だと保存できないこと' do
      @buyer_buyeraddress.phonenumber = nil
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("Phonenumber can't be blank")
    end
    it 'phonenumberは11桁の半角英数字であること' do
      @buyer_buyeraddress.phonenumber = "123456789"
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("Phonenumber is 11 digits")
    end
    it 'priceが空だと保存できないこと' do
      @buyer_buyeraddress.price = nil
      @buyer_buyeraddress.valid?
      expect(@buyer_buyeraddress.errors.full_messages).to include("Price can't be blank")
    end
  end
end
