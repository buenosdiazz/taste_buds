class WelcomeController < ApplicationController
  def home 
    @lists = current_user.followed_lists
    render 'home'
  end 

  def show
    @lists = List.all 
   render 'show'
  end 
end
