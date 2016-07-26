class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @tables = Table.all
  end

  def show
    @table = Table.find_by(id:params[:id])
    render "show"
  end

  def new
    @table = current_user.tables.new
    render "new"
  end

  def edit
    @table = Table.find_by(id:params[:id])
    render 'edit'
  end

  def create
   @table = current_user.tables.new(table_params)
      if @table.save
      redirect_to "/tables/#{@table.id}"
      else
      render :new 
      end
  end
  

  def update
  @table = Table.find_by(id:params[:id])
      if @table.update(table_params)
        redirect_to url_for({ :controller => 'users', :action => 'show', :id => current_user.id })
      else
        render :edit
      end
  end
  

  def destroy
  @table = Table.find_by(id:params[:id])
  @table.destroy
  redirect_to url_for({ :controller => 'users', :action => 'show', :id => current_user.id })
  end

  private

    # Never trust parameters from the scary internet, only allow the white table through.
    def table_params
      params.require(:table).permit(:title)
    end

    def correct_user 
      @table= current_user.tables.find_by(id:params[:id])
      redirect_to tables_path, notice: "Not authorized to edit list" if @table.nil? 
    end 
end
