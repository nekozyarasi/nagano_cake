class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(Owner)
        admin_orders_path
    else
        root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :owner
      new_owner_session_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up,keys: [:family_name, :first_name, :kana_family_name, :kana_first_name, :post, :address, :phone])
  end


end
