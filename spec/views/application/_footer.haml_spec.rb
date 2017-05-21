# frozen_string_literal: true

require "rails_helper"

RSpec.describe "application/_footer.haml" do
  it "includes a link to the author's GitHub profile" do
    render
    expect(rendered).to match("https://github.com/kostyadubinin")
  end

  it "includes the author name" do
    render
    expect(rendered).to match("Kostya Dubinin")
  end
end
