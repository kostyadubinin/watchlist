require "rails_helper"

RSpec.describe "movies/index" do
  let(:api) { TmdbApi.new }
  before { stub_movie_popular_request }

  it "displays 20 movies" do
    assign(:movies, api.movie_popular["results"])

    render

    assert_select ".card", 20
  end
end
