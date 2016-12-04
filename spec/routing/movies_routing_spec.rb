require "rails_helper"

RSpec.describe "routes for Movies" do
  it "routes /movies to movies#index" do
    expect(get("/movies")).to route_to("movies#index")
  end
end
