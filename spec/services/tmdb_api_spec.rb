# frozen_string_literal: true
require "rails_helper"

RSpec.describe TmdbApi do
  describe "#client" do
    subject { described_class.new.client }

    it "is a Faraday::Connection object" do
      expect(subject).to be_a(Faraday::Connection)
    end

    it "uses api.themoviedb.org host" do
      expect(subject.host).to eq("api.themoviedb.org")
    end

    it "uses proper api_key" do
      ENV["TMDB_API_KEY"] = "tmdb_api_key"
      expect(subject.params[:api_key]).to eq("tmdb_api_key")
    end

    it "uses HTTPS" do
      expect(subject.scheme).to eq("https")
    end
  end

  describe "#movie_popular" do
    subject { described_class.new.movie_popular }
    before { stub_movie_popular_request }

    it "contains current page number" do
      expect(subject["page"]).to eq(1)
    end

    it "returns 20 results" do
      expect(subject["results"].count).to eq(20)
    end

    it "contains result's id" do
      expect(subject["results"][0]["id"]).to eq(297_761)
    end
  end
end
