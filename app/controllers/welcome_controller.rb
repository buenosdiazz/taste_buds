class WelcomeController < ApplicationController
  def home 
    @lists = List.all 
    render 'home'
  end 

  def show
    @lists = List.all 
   render 'show'
  end 
end
