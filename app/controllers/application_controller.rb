class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  helper_method :current_project

  private

  def current_project
    Project.find(session[:project_id]) rescue Project.last
  end
end
