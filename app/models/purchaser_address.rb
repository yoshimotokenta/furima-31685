class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :name, :seller, :price, :postal_code, :prefecture_id, :municipality, :number, :building_name, :phone_number

  with_options presence: true do
    validates :price
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :number
    validates :phone_number, format: {with: /\A((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}\z/,message: "Input only number"}
    end


  def save
    Purchaser.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, number: number, building_name: building_name,phone_number: phone_number, parchaser:parchaser )
  end
end