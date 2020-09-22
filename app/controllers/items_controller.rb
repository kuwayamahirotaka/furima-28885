class ItemsController < ApplicationController
  before_action :item_set, only: [:edit, :show, :update, :destroy]
  

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
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
    redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:detail,:category_id,:status_id,:transfee_id,:transregion_id,:transdate_id,:price).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

 

end
