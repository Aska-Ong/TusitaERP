class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_locale

  def set_locale
  	I18n.locale = params[:locale] || I18n.default_locale
  end

  protect_from_forgery with: :exception
  include SessionsHelper

  def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { :locale => I18n.locale }
   end

  def redirect_to(options = {}, response_status = {})
  if request.xhr?
    render(:update) {|page| page.redirect_to(options)}
  else
    super(options, response_status)
  end
  end

end
