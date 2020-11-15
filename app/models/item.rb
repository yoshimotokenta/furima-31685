class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :seller
  belongs_to :condition
  belongs_to :category
  belongs_to :area
  belongs_to :estimated

  validates :seller_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :estimated_id, numericality: { other_than: 1 } 
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true
  validates :image, presence: true

  has_one_attached :image
  belongs_to :user
  has_one :purchaser

end