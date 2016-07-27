class ItemsController < ApplicationController
  before_action :all_items, only: [:index, :create]
  respond_to :html, :js

  def index
  @items = Item.all

  respond_to do |format|
    format.html
    format.json
  end
  end

   def show
    @item= Item.find_by(id:params[:id])
    render "show"
  end


  def new
    @list= List.find_by(id:params[:list_id])
    @item = @list.items.new 
  end

  def create
    @list= List.find_by(id:params[:list_id])
    @item= @list.items.new(item_params)
    @item.save
  end


 private
    def all_items
      @items = Item.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name)
    end

end
