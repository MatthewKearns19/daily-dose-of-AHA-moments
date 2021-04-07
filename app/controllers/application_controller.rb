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
  def client
    @client ||= Hackernews::Client.new
  end

  # initialize top news articles
  #def initialize_stories
  #  @stories = client.topstories(0, 10).limit(4)
  #end

end
