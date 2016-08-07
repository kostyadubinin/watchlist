# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationMailer do
  it "sends emails from 'from@example.com'" do
    expect(ApplicationMailer.default[:from]).to eq("from@example.com")
  end

  it "uses layout 'mailer'" do
    expect(ApplicationMailer._layout).to eq("mailer")
  end
end
