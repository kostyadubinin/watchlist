# frozen_string_literal: true
require "rails_helper"

RSpec.describe ApplicationController do
  controller do
    def index
      render plain: "OK"
    end
  end

  let(:custom_locale) { (I18n.available_locales - [I18n.default_locale]).first }
  let(:default_locale) { I18n.default_locale }

  describe "setting locale" do
    context "when the locale is not provided" do
      it "sets the locale to the default locale" do
        I18n.locale = custom_locale
        get :index
        expect(I18n.locale).to eq(default_locale)
      end
    end

    context "when the locale is provided" do
      context "when the provided locale is not available" do
        it "sets the locale to the default locale" do
          I18n.locale = custom_locale
          get :index, params: { locale: :elvish }
          expect(I18n.locale).to eq(default_locale)
        end
      end

      context "when the provided locale is available" do
        it "sets the locale to the provided locale" do
          get :index, params: { locale: custom_locale }
          expect(I18n.locale).to eq(custom_locale)
        end
      end
    end
  end

  describe "default URL options" do
    it "include a locale" do
      I18n.locale = custom_locale
      expect(root_path).to include("locale=#{custom_locale}")
    end
  end
end
