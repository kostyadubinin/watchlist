# frozen_string_literal: true
require "rails_helper"

RSpec.describe "movies/index" do
  let(:api) { TmdbApi.new }
  before { stub_movie_popular_request }

  it "displays 20 movies" do
    movies = Kaminari.
             paginate_array(api.movie_popular["results"], total_count: 145).
             page(1)

    assign(:movies, movies)

    render

    assert_select ".card", 20
  end
end
