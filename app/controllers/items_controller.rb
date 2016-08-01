class ItemsController < ApplicationController

  def index
  items = Item.all
  render json: items
  end

   def show
    item= Item.find_by(id:params[:id])
    render json: item
  end



 private
 
    def item_params
      params.require(:item).permit(:name)
    end

end


