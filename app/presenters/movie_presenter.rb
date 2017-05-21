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

  def release_date
    h.time_ago_in_words(parsed_release_date) if parsed_release_date.present?
  end

  private

  # TODO: Find a better solution.
  def parsed_release_date
    Date.parse(movie["release_date"])
  rescue ArgumentError, TypeError => e
    Raven.capture_exception(e)
    nil
  end
end
