# frozen_string_literal: true
class MoviePresenter < BasePresenter
  alias movie model

  def backdrop_url
    "#{IMAGES_SECURE_BASE_URL}#{BACKDROP_SIZE}#{movie['backdrop_path']}"
  end

  def vote_average
    vote_average = movie["vote_average"]
    h.number_with_precision(vote_average, precision: 2, significant: true)
  end
end
