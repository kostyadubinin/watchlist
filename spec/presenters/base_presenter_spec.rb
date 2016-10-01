# frozen_string_literal: true
require "rails_helper"

RSpec.describe BasePresenter do
  subject(:presenter) { described_class.new(:a, :b) }

  it "responds to #model" do
    expect(presenter.model).to eq(:a)
  end

  it "responds to #h" do
    expect(presenter.h).to eq(:b)
  end
end
