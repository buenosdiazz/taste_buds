class TablesController < ApplicationController
   def index
    @tables = Table.all
  end

  def show
    @table = Table.find_by(id:params[:id])
    render "show"
  end

  def new
    @table = Table.new
    render "new"
  end

  def edit
    @table = Table.find_by(id:params[:id])
    render 'edit'
  end

  def create
   @table = Table.new(table_params)
      if @table.save
      redirect_to "/tables/#{@table.id}"
      else
      render :new 
      end
  end
  

  def update
  @table = Table.find_by(id:params[:id])
      if @table.update(table_params)
        redirect_to @table
      else
        render :edit
      end
  end
  

  def destroy
  @table = Table.find_by(id:params[:id])
  @table.destroy
    redirect_to"/tables"
  end

  private

    # Never trust parameters from the scary internet, only allow the white table through.
    def table_params
      params.require(:table).permit(:title)
    end
end
