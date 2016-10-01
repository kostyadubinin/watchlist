# frozen_string_literal: true
require "rails_helper"

RSpec.describe MoviePresenter do
  subject(:presenter) { described_class.new("a", "b") }

  it "aliases #movie to #model" do
    expect(presenter.movie).to equal(presenter.model)
  end

  describe "#backdrop_url" do
    before { stub_movie_popular_request }

    # TODO: Extract to a single place.
    let(:api) { TmdbApi.new }

    let(:movie) { api.movie_popular["results"].first }

    subject(:presenter) { MoviePresenter.new(movie, _) }

    it "returns a backdrop url" do
      base_url = described_class::IMAGES_SECURE_BASE_URL
      backdrop_size = described_class::BACKDROP_SIZE
      backdrop_path = movie["backdrop_path"]

      expect(presenter.backdrop_url).
        to eq("#{base_url}#{backdrop_size}#{backdrop_path}")
    end
  end
end