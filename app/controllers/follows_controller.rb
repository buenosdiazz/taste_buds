class FollowsController < ApplicationController
respond_to :js

  def follow
    @follower = current_user
    @list = List.find(params[:list_id])
    @follower.follow!(@list)
  end

  def unfollow
   @follower = current_user
   @follow = @follower.follows.find(params[:followed_list_id])
   @list = List.find(params[:list_id])
   @follow.destroy!
  end
end

