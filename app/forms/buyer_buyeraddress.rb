class BuyerBuyeraddress

  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :prefecture, :city, :house_number, :building_name, :phonenumber

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token, presence: { message: "is invalid. "}
    
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phonenumber, format: {with: /\A\d{10,11}\z/, message: "is invalid. "}
  end

  def save
    Buyeraddress.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phonenumber: phonenumber, user_id: user_id)
    Buyer.create(item_id: item_id, user_id: user_id)
  end
end