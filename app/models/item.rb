class Item < ApplicationRecord

  
  validates :name, presence: true, length: {maximum: 40}
  validates :show, presence: true, length: {maximum: 1000}
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :transfee_id, presence: true
  validates :transregion_id, presence: true
  validates :transdate, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/}, inclusion: {in: 300..9999999 }  


  belongs_to :user
  has_one_attached :image
end
