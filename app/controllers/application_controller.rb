class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :notifications
protected 
  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end 
   def after_sign_in_path_for(resource)
    "/" # Or :prefix_to_your_route
  end

 def notifications
 if user_signed_in? 
    @new_follower_notifications = Follow.where(list_id: 'owned_lists')
    @updated_list_notifications = Follow.where(user_id: current_user.id)
  else 
  end 
  end 
 

end


