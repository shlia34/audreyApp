class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :show, :follow_list, :follower_list]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :profile])
  end

   # before_action :basic_auth

  # private
  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == 'shira' && password == 'shira'
  #   end
  # end

end
