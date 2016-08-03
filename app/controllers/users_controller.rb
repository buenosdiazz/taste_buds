class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show 

   def show
    @user = User.find_by(id:params[:id])
    @lists = List.where(user_id: @user.id)
    render 'show'
  end 



private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def user_params
  params.require(:user).permit(:avatar)
end

end



