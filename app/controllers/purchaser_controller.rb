class PurchaserController < ApplicationController

  def index
    @items =Item.find(params[:item_id])
    @purchaser_address = PurchaserAddress.new
  end


  def create
    @purchaser_address = PurchaserAddress.new(purchaser_params)
    @items =Item.find(params[:item_id])
    if @purchaser_address.valid?
      @purchaser_address.save
      redirect_to root_path
    else
     render action: :index
    end
  end

  private

  def purchaser_params
    params.permit(:postal_code, :area_id, :municipality, :number, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
