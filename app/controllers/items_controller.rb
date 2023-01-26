class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
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
      params.require(:item).permit(:name, :content, :category_id, :state_id, :deliverycharge_id, :sender_id, :scheduleddelivery_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end

end
