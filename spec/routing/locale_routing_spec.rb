# frozen_string_literal: true

require "rails_helper"

RSpec.describe "routes with locale" do
  it "doesn't route an unsupported locale" do
    expect(get: "/elvish").not_to be_routable
  end

  it "routes / to movies index and does not set params[locale]" do
    expect(get: "/").to route_to(controller: "movies", action: "index")
  end

  it "routes /en to movies index and sets params[locale] == :en" do
    expect(get: "/en").to(
      route_to(controller: "movies", action: "index", locale: "en")
    )
  end

  it "routes /nl to movies index and sets params[locale] == :nl" do
    expect(get: "/nl").to(
      route_to(controller: "movies", action: "index", locale: "nl")
    )
  end
end
