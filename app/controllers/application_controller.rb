class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def after_sign_in_path_for(resource)
      if current_user.superadmin?
        dashboard_super_admin_index_path
      elsif current_user.admin?
        dashboard_admins_path
      else
        root_path
      end
    end
end



