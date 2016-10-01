# frozen_string_literal: true
class BasePresenter
  IMAGES_SECURE_BASE_URL = "https://image.tmdb.org/t/p/"
  BACKDROP_SIZE = "w780"

  attr_reader :model, :h

  def initialize(model, h)
    @model = model
    @h = h
  end
end
