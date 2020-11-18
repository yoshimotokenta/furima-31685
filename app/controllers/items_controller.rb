class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update,:destroy]

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
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
     end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else 
      render :edit
    end

  end


  def show
  end


  def destroy
    unless user_signed_in? && current_user.id == @item.user_id
    if @item.destroy
    redirect_to action: :index
    else
    render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:category_id,:condition_id,:area_id,:seller_id,:estimated_id,:name,:info,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
