class ItemsController < ApplicationController
  before_action :item_set, only: [:edit, :show]

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

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:show,:category_id,:status_id,:transfee_id,:transregion_id,:transdate_id,:price).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

end
