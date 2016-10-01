# frozen_string_literal: true
require "rails_helper"

RSpec.describe MoviePresenter do
  subject(:presenter) { described_class.new("a", "b") }

  it "aliases #movie to #model" do
    expect(presenter.movie).to equal(presenter.model)
  end
end
