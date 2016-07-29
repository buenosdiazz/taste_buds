class CategoriesController < ApplicationController

def show
    @category= Category.find_by(id:params[:id])
    @lists = @category.lists
    render "show"
  end

end
