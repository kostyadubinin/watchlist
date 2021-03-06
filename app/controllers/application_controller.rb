# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    locale = params[:locale]
    locale = I18n.locale_available?(locale) ? locale : I18n.default_locale
    I18n.locale = locale
  end

  def api
    @api ||= TmdbApi.new
  end
end
