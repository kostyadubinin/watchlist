# frozen_string_literal: true
require "rails_helper"

RSpec.describe TmdbApi do
  describe "#client" do
    it "is a Faraday::Connection object" do
      expect(TmdbApi.new.client).to be_a(Faraday::Connection)
    end

    it "uses api.themoviedb.org host" do
      expect(TmdbApi.new.client.host).to eq("api.themoviedb.org")
    end

    it "uses proper api_key" do
      ENV["TMDB_API_KEY"] = "tmdb_api_key"
      expect(TmdbApi.new.client.params[:api_key]).to eq("tmdb_api_key")
    end

    it "uses HTTPS" do
      expect(TmdbApi.new.client.scheme).to eq("https")
    end
  end
end
