# frozen_string_literal: true
require "rails_helper"

RSpec.describe ApplicationController do
  controller do
    def index
      render plain: "OK"
    end
  end

  # This tests will fail if the default locale is changed from :en to something
  # else. Before adding more tests try to make them independent from the default
  # locale.
  describe "setting locale" do
    context "when the locale is not provided" do
      it "sets the locale to the default locale" do
        I18n.locale = :nl
        get :index
        expect(I18n.locale).to eq(:en)
      end
    end

    context "when the locale is provided" do
      context "when the provided locale is not available" do
        it "sets the locale to the default locale" do
          I18n.locale = :nl
          get :index, params: { locale: :elvish }
          expect(I18n.locale).to eq(:en)
        end
      end

      context "when the provided locale is available" do
        it "sets the locale to the provided locale" do
          I18n.locale = :en
          get :index, params: { locale: :nl }
          expect(I18n.locale).to eq(:nl)
        end
      end
    end
  end

  describe "default URL options" do
    it "include a locale" do
      I18n.locale = :nl
      expect(root_path).to include("locale=nl")
    end
  end
end
