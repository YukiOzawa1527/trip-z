class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
  when Admin
    admin_root_path
  when User
    my_page_path
  end
  end

  def after_sign_out_path_for(resource_or_scope)
    about_path # ログアウト後の遷移先を指定
  end
end
