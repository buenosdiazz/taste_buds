class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show 

   def show
    @user = User.find(params[:id])
    @lists = @user.tables
    render 'show'
  end 
end
