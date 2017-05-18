class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

    def update_sanitized_params
       devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation)}
       devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:name, :email, :password)}
       devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :contact_no, :address1, :address2)}
    end

end