# frozen_string_literal: true
require "rails_helper"

RSpec.describe MoviePresenter, type: :helper do
  before { stub_movie_popular_request }

  # TODO: Extract to a single place.
  let(:api) { TmdbApi.new }

  let(:movie) { api.movie_popular["results"].first }

  subject(:presenter) { MoviePresenter.new(movie, helper) }

  it "aliases #movie to #model" do
    expect(presenter.movie).to equal(presenter.model)
  end

  describe "#backdrop_url" do
    it "returns a backdrop url" do
      base_url = described_class::IMAGES_SECURE_BASE_URL
      backdrop_size = described_class::BACKDROP_SIZE
      backdrop_path = movie["backdrop_path"]

      expect(presenter.backdrop_url).
        to eq("#{base_url}#{backdrop_size}#{backdrop_path}")
    end
  end

  describe "#vote_average" do
    it "rounds vote average" do
      movie = { "vote_average" => 5.85 }
      presenter = MoviePresenter.new(movie, helper)

      expect(presenter.vote_average).to eq("5.9")
    end
  end

  describe "#release_date" do
    it "returns nil if the date is nil" do
      movie = { "release_date" => nil }
      presenter = MoviePresenter.new(movie, helper)

      expect(presenter.release_date).to eq(nil)
    end

    it "returns nil if the date is an empty string" do
      movie = { "release_date" => "" }
      presenter = MoviePresenter.new(movie, helper)

      expect(presenter.release_date).to eq(nil)
    end

    it "returns a distance of time in words to now" do
      date = (Date.current - 17.months).to_s
      movie = { "release_date" => date }

      presenter = MoviePresenter.new(movie, helper)

      expect(presenter.release_date).
        to eq(I18n.t("datetime.distance_in_words.over_x_years.one"))
    end
  end
end
