class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :seller
  belongs_to :condition
  belongs_to :category
  belongs_to :area
  belongs_to :estimated

  with_options numericality: { other_than: 1 } do
  validates :seller_id
  validates :category_id
  validates :condition_id
  validates :area_id
  validates :estimated_id
  end

  with_options presence: true do
  validates :image
  validates :name
  validates :info
  validates :price
  end

  validates :price,  numericality: { only_integer: true, :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999}
  validates :price, format: { with: /\A[0-9]\w*\z/, message: "販売価格は半角数字を使用してください" }

  has_one_attached :image
  belongs_to :user
  has_one :purchaser

end