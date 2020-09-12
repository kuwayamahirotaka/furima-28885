class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end

  private

  def message_params
    params.require(:name).permit(:content, :image)
  end
end
