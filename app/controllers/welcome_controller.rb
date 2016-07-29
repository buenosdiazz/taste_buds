class WelcomeController < ApplicationController
  def home 
    # if user_signed_in?
    # @lists = current_user.followed_lists
    # else 
    @lists = List.all 
    render 'home'
     @updated_list_notifications
  end 

  def show
    @lists = List.all 
   render 'show'
  end 

  
end
