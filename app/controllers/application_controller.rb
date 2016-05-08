class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticated?
  helper_method :current_user
  helper_method :logged_in?

  private

  def current_user
    if session[:user_id]
      if session[:user_type] == "student"
        @current_user ||= Student.find(session[:user_id])
      end
    end
  end

  def logged_in?
    return current_user.present?
  end

  def authenticated?
    if params[:controller] == 'sessions' and ['new', 'create'].include? params[:action]
      redirect_to dashboard_index_url if logged_in?
    else
      redirect_to root_url unless logged_in?
    end
  end
end
