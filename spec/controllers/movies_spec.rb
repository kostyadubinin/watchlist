# frozen_string_literal: true

require "rails_helper"

RSpec.describe MoviesController do
  describe "GET index" do
    it "returns a 200 OK status" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
