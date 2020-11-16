class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :seller
  belongs_to :condition
  belongs_to :category
  belongs_to :area
  belongs_to :estimated

  validates :image, presence: true
  validates :seller_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :estimated_id, numericality: { other_than: 1 } 
  validates :name, presence: true
  validates :info, presence: true
  validates :price,presence: true
  validates :price,  numericality: { only_integer: true, :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999}
  validates :price, format: { with: /\A[0-9]\w*\z/, message: "販売価格は半角数字を使用してください" }

  has_one_attached :image
  belongs_to :user
  has_one :purchaser

end