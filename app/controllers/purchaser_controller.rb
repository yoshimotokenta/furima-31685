class PurchaserController < ApplicationController

  def index
    @items =Item.find(params[:item_id])
  end

  def show
  end

  def create
  end

end
