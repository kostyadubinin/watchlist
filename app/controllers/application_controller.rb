# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = if I18n.locale_available?(params[:locale])
                    params[:locale]
                  else
                    I18n.default_locale
                  end
  end
end
