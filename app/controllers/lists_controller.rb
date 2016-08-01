class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @lists = current_user.owned_lists.all
  end

  def show
    @list = List.find_by(id:params[:id])
    @items = @list.items 
    render "show"
  end

  def new
    @list = current_user.owned_lists.new
    @items = @list.items
    @categories = Category.all.map{|c| [ c.name, c.id ] }
    render 'new'
  end

  def edit
    @list = current_user.owned_lists.find_by(id:params[:id])
    render 'edit'
  end

  def create
   @list = current_user.owned_lists.new(list_params)
   @list.category_id = params[:category_id] 
      if @list.save
      redirect_to "/lists/#{@list.id}"
      else
      render :new 
      end
  end
  

  def update
  @list = current_user.owned_lists.find_by(id:params[:id])
      if @list.update(list_params)
        redirect_to url_for({ :controller => 'users', :action => 'show', :id => current_user.id })
      else
        render :edit
      end
  end
  

  def destroy
  @list = current_user.owned_lists.find_by(id:params[:id])
  @list.destroy
  redirect_to url_for({ :controller => 'users', :action => 'show', :id => current_user.id })
  end

  def additem
    p "-------------------------------------------¬"
    p "-------------------------------------------¬"
    p "-------------------------------------------¬"
    p "-------------------------------------------¬"
    p "-------------------------------------------¬"


    p params.inspect 

  @list= List.find_by(id:params[:list_id])
   name = params[:name]
   poster = params[:poster]
   item= @list.items.create(:name => name, :poster => poster)
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title)
    end

   def item_params
      params.require(:item).permit(:name, :poster)
    end
    def correct_user 
      @list= current_user.owned_lists.find_by(id:params[:id])
      redirect_to lists_path, notice: "Not authorized to edit list" if @list.nil? 
    end 
end
