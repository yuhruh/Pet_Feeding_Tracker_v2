class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user, :set_current_time, :set_current_date, :logged_in?
  before_action :set_current_date, :set_current_time
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_current_time
    Time.zone = current_user.time_zone
    Time.current.strftime("%H:%M")
  end

  def set_current_date
    Time.zone = current_user.time_zone
    Date.current.strftime("%Y-%m-%d")
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must logged in to perform this action"
      redirect_to login_path
    end
  end

  before_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
    # I18n.locale = params[:locale] || I18n.default_locale
  end
end
