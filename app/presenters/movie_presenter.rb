# frozen_string_literal: true
class MoviePresenter < BasePresenter
  alias movie model

  def backdrop_url
    "#{IMAGES_SECURE_BASE_URL}#{BACKDROP_SIZE}#{movie['backdrop_path']}"
  end
end
