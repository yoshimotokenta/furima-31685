class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :number, :building_name, :phone_number, :parchaser_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :number
    validates :phone_number, format: {with: /\A((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}\z/,message: "Input only number"}
    validates :token
  end


  def save
    purchaser = Purchaser.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, number: number, building_name: building_name, phone_number: phone_number, purchaser_id: purchaser.id )
  end


end