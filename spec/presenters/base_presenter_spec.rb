# frozen_string_literal: true
require "rails_helper"

RSpec.describe BasePresenter do
  subject(:presenter) { described_class.new(:a, :b) }
  let(:configuration) { JSON(read_fixture("configuration.json")) }

  it "defines IMAGES_SECURE_BASE_URL" do
    expect(described_class::IMAGES_SECURE_BASE_URL).
      to eq(configuration["images"]["secure_base_url"])
  end

  it "defines BACKDROP_SIZE" do
    expect(configuration["images"]["backdrop_sizes"]).
      to include(described_class::BACKDROP_SIZE)
  end

  it "responds to #model" do
    expect(presenter.model).to eq(:a)
  end

  it "responds to #h" do
    expect(presenter.h).to eq(:b)
  end
end
