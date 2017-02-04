# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationMailer do
  it "sends emails from 'from@example.com'" do
    expect(described_class.default[:from]).to eq("from@example.com")
  end

  it "uses layout 'mailer'" do
    expect(described_class._layout).to eq("mailer")
  end
end
