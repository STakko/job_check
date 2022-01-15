class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    if current_admin
      admin_path
    elsif current_shared_user
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
        new_admin_session_path
    else
        new_shared_user_session_path
    end
  end

end
