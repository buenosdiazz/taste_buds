class FollowsController < ApplicationController
respond_to :js

  def follow
    @user = current_user
    @list = List.find(params[:list_id])
    @user.follow!(@list)
    render 'follow'
  end

  def unfollow
   @user= current_user
   @follow = @user.follows.find_by_list_id(params[:list_id])
   @list = List.find(params[:list_id])
   @follow.destroy!
   render 'unfollow'
  end
end

