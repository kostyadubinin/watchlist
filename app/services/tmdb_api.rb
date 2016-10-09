# frozen_string_literal: true
class TmdbApi
  API_URL = "https://api.themoviedb.org/3/"

  def client
    @client ||= Faraday.new(url: API_URL) do |faraday|
      faraday.params[:api_key] = ENV["TMDB_API_KEY"]
      faraday.params[:language] = I18n.locale
      faraday.response :json, content_type: /\bjson$/
      faraday.adapter Faraday.default_adapter
    end
  end

  def movie_popular(page: 1)
    client.get("movie/popular", page: page).body
  end
end
