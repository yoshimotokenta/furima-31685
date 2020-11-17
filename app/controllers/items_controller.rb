class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show、:edit]

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
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
     end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else 
      render :edit
    end

  end


  def show
    @item = Item.find(params[:id])
  end



  private

  def item_params
    params.require(:item).permit(:image,:category_id,:condition_id,:area_id,:seller_id,:estimated_id,:name,:info,:price).merge(user_id: current_user.id)
  end
end
