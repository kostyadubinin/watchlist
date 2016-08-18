require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#other_locale" do
    it "returns :nl if the current locale is :en" do
      I18n.locale = :en
      expect(helper.other_locale).to eq(:nl)
    end

    it "returns :en if the current locale is :nl" do
      I18n.locale = :nl
      expect(helper.other_locale).to eq(:en)
    end
  end

  describe "#flag_class" do
    it "returns what it receives if it is not :en" do
      expect(helper.flag_class(:nl)).to eq(:nl)
    end

    it "returns :us if it receives :en" do
      expect(helper.flag_class(:en)).to eq(:us)
    end
  end
end
