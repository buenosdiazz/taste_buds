class RegistrationsController < Devise::RegistrationsController
 protected

  def after_sign_up_path_for(resource)
    "/show" # Or :prefix_to_your_route
  end
  
  def configure_permitted_parameters 
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end 
end
