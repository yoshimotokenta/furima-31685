class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
    #@items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new 
      end
  end


  private

  def item_params
    params.require(:item).permit(:image,:category_id,:condition_id,:area_id,:seller_id,:estimated_id,:name,:info,:price).merge(user_id: current_user.id)
  end
end
