# frozen_string_literal: true

module ApplicationHelper
  def other_locale
    I18n.locale == :en ? :nl : :en
  end

  def flag_class(locale)
    locale == :en ? :us : locale
  end

  def present(model, with:)
    presenter = with.new(model, self)
    block_given? ? yield(presenter) : presenter
  end
end
