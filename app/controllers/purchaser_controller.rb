class PurchaserController < ApplicationController

  def index
    @items =Item.find(params[:item_id])
    @item_purchaser = Purchaser.new 
  end

  def show
  end

  def create
    
  end

end
