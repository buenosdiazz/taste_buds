class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @lists = List.all
  end

  def show
    @list = List.find_by(id:params[:id])
    render "show"
  end

  def new
    @list = current_user.lists.new
    render "new"
  end

  def edit
    @list = List.find_by(id:params[:id])
    render 'edit'
  end

  def create
   @list = current_user.lists.new(list_params)
      if @list.save
      redirect_to "/lists/#{@list.id}"
      else
      render :new 
      end
  end
  

  def update
  @list = List.find_by(id:params[:id])
      if @list.update(list_params)
        redirect_to url_for({ :controller => 'users', :action => 'show', :id => current_user.id })
      else
        render :edit
      end
  end
  

  def destroy
  @list = List.find_by(id:params[:id])
  @list.destroy
  redirect_to url_for({ :controller => 'users', :action => 'show', :id => current_user.id })
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title)
    end

    def correct_user 
      @list= current_user.lists.find_by(id:params[:id])
      redirect_to lists_path, notice: "Not authorized to edit list" if @list.nil? 
    end 
end
