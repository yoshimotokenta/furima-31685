class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
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

  def edit
  end


  def show
    @item = Item.find(params[:id])
  end



  private

  def item_params
    params.require(:item).permit(:image,:category_id,:condition_id,:area_id,:seller_id,:estimated_id,:name,:info,:price).merge(user_id: current_user.id)
  end
end
