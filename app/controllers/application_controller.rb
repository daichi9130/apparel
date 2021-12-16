class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if customer_signed_in?
      customer_path(current_customer)
    else
      admins_root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :customer
      root_path
    else
      new_admin_session_path
    end
  end

 end