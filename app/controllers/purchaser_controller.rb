class PurchaserController < ApplicationController
   before_action :authenticate_user!
   before_action :set_item
   

  def index
    @purchaser_address = PurchaserAddress.new
    if current_user.id == @item.user_id || @item.purchaser.present?
      redirect_to root_path
    end
  end

  def create
    @purchaser_address = PurchaserAddress.new(purchaser_params)
    if @purchaser_address.valid?
      pay_item
      @purchaser_address.save
      redirect_to root_path
    else
     render action: :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_address)
    .permit(
      :postal_code, 
      :area_id, 
      :municipality, 
      :number, 
      :phone_number, 
      :building_name)
      .merge(
        user_id: current_user.id, 
        item_id: params[:item_id], 
        token: params[:token]
      )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchaser_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  def set_item
    @item =Item.find(params[:item_id])
  end
end

