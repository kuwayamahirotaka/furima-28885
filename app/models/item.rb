class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :transfee
  belongs_to_active_hash :transregion
  belongs_to_active_hash :transdate
  
  validates :image, presence: true
  validates :name, presence: true, length: {maximum: 40}
  validates :detail, presence: true, length: {maximum: 1000}
  validates :category_id, numericality: { other_than: 1, message: 'Please select one'}
  validates :status_id, numericality: { other_than: 1, message: 'Please select one' }
  validates :transfee_id, numericality: { other_than: 1, message: 'Please select one' }
  validates :transregion_id, numericality: { other_than: 0, message: 'Please select one'}
  validates :transdate_id, numericality: { other_than: 1, message: 'Please select one'}
  validates :price, presence: true, format: { with: /\A[1-9][0-9]*\z/}, inclusion: {in: 300..9999999, message: 'Please input ¥300~¥9,999,999'}  

  belongs_to :user
  has_one_attached :image
  has_one    :buyer
end
