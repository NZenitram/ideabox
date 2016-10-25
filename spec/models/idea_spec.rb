require 'rails_helper'

describe Idea do
  context "valid attributes" do
    scenario "idea invalid without content" do
      idea = Idea.new

      expect(idea).to be_invalid
    end
  end
end
