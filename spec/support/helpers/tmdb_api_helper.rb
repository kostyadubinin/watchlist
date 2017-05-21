# frozen_string_literal: true

module TmdbApiHelper
  def stub_movie_popular_request
    stub_request(
      :get,
      "https://api.themoviedb.org/3/movie/popular"
    ).with(
      query: hash_including(api_key: ENV["TMDB_API_KEY"])
    ).to_return(
      status: 200,
      body: read_fixture("movie_popular.json"),
      headers: { "Content-Type" => "application/json; charset=utf-8" }
    )
  end
end
