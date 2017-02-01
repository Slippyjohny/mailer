class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :task_notifications


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :current_password,
                                                               :first_name, :last_name, :invite_token) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password,
                                                                      :first_name, :last_name, :invite_token) }
  end
  def task_notifications
    if user_signed_in?
      @notifications = current_user.notifications
    end
  end

end
