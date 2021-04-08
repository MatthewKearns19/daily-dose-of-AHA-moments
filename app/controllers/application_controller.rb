class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # allow user account updates
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update , keys: [:first_name, :last_name, :username])
    devise_parameter_sanitizer.permit(:sign_up , keys: [:first_name, :last_name, :username])
  end

  # initialize hacker news client in here so all controllers can have access to it
  def hacker_news_client
    @hacker_news_client ||= Hackernews::Client.new
  end

  def custom_latest_news_client
    @custom_latest_news_client ||= Newscatcher::Client.new
  end

  def news_api
    @news_api ||= Newsapi::Client.new
  end

end
