# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#other_locale" do
    after { I18n.locale = I18n.default_locale }

    it "returns :nl if the current locale is :en" do
      I18n.locale = :en
      expect(helper.other_locale).to eq(:nl)
    end

    it "returns :en if the current locale is :nl" do
      I18n.locale = :nl
      expect(helper.other_locale).to eq(:en)
    end
  end

  describe "#flag_class" do
    it "returns what it receives if it is not :en" do
      expect(helper.flag_class(:nl)).to eq(:nl)
    end

    it "returns :us if it receives :en" do
      expect(helper.flag_class(:en)).to eq(:us)
    end
  end

  describe "#present" do
    let(:movie) { read_fixture("movie_popular.json")["results"][0] }

    it "returns an instance of the given presenter" do
      presenter = helper.present(movie, with: MoviePresenter)
      expect(presenter).to be_an_instance_of(MoviePresenter)
    end

    it "represents the given object" do
      presenter = helper.present(movie, with: MoviePresenter)
      expect(presenter.model).to eq(movie)
    end

    it "accepts a block" do
      helper.present(movie, with: MoviePresenter) do |movie_presenter|
        expect(movie_presenter.model).to eq(movie)
      end
    end
  end
end
