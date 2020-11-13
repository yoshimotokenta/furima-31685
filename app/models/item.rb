class Item < ApplicationRecord
  validates :seller_id, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :area_id, presence: true
  validates :estimated, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true

  has_one_attached :image
  belongs_to :user
  has_one :purchaser
end
