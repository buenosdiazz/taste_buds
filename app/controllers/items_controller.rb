class ItemsController < ApplicationController

  def index
  items = Item.all
  render json: items
  end

   def show
    item= Item.find_by(id:params[:id])
    render json: item
  end


  def create
    list= List.find_by(id:params[:list_id])
    item= list.items.create(item_params)
    render json: item
  end

  def update
    list= List.find_by(id:params[:list_id])
    item= @list.items.find_by(id:params[:item_id])
    item.update(item_params)
    render json: item
  end


  def destroy
    list= List.find_by(id:params[:list_id])
    item= @list.items.find_by(id:params[:item_id])
    item.destroy
    render json: item
  end

 private
 
    def item_params
      params.require(:item).permit(:name)
    end

end


