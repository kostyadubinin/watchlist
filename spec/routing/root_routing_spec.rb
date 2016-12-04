# frozen_string_literal: true

require "rails_helper"

RSpec.describe "root route" do
  it "routes / to movies#index" do
    expect(get("/")).to route_to("movies#index")
  end
end
