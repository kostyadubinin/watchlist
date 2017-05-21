# frozen_string_literal: true

require "rails_helper"

RSpec.describe TmdbApi do
  describe "#client" do
    subject(:client) { described_class.new.client }

    it "uses api.themoviedb.org host" do
      expect(client.host).to eq("api.themoviedb.org")
    end

    it "uses proper api_key" do
      ENV["TMDB_API_KEY"] = "tmdb_api_key"
      expect(client.params[:api_key]).to eq("tmdb_api_key")
    end

    it "uses HTTPS" do
      expect(client.scheme).to eq("https")
    end

    it "uses current locale" do
      expect(client.params[:language]).to eq(I18n.locale)
    end

    # TODO: Looks weird.
    it "uses custom locale" do
      I18n.locale = (I18n.available_locales - [I18n.default_locale]).first
      expect(client.params[:language]).to eq(I18n.locale)
      I18n.locale = I18n.default_locale
    end
  end

  describe "#movie_popular" do
    context "basic" do
      before { stub_movie_popular_request }

      subject(:client) { described_class.new.movie_popular }

      it "contains current page number" do
        expect(client["page"]).to eq(1)
      end

      it "returns 20 results" do
        expect(client["results"].count).to eq(20)
      end

      it "contains result's id" do
        expect(client["results"][0]["id"]).to eq(297_761)
      end
    end

    context "pagination" do
      before { stub_movie_popular_request }

      subject(:client) { described_class.new.movie_popular(page: 2) }

      it "accepts page number" do
        expect(client["results"][0]["id"]).to eq(297_761)
      end
    end
  end
end
