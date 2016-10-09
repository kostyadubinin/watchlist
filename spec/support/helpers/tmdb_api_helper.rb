# frozen_string_literal: true
module TmdbApiHelper
  def stub_movie_popular_request_page_1
    stub_request(
      :get,
      "https://api.themoviedb.org/3/movie/popular"
    ).with(
      query: { api_key: ENV["TMDB_API_KEY"], language: I18n.locale, page: 1 }
    ).to_return(
      status: 200,
      body: read_fixture("movie_popular.json"),
      headers: { "Content-Type" => "application/json; charset=utf-8" }
    )
  end

  def stub_movie_popular_request_page_2
    stub_request(
      :get,
      "https://api.themoviedb.org/3/movie/popular"
    ).with(
      query: { api_key: ENV["TMDB_API_KEY"], language: I18n.locale, page: 2 }
    ).to_return(
      status: 200,
      body: read_fixture("movie_popular.json"),
      headers: { "Content-Type" => "application/json; charset=utf-8" }
    )
  end
end
