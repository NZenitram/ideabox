require 'rails_helper'

describe Category do
  context "valid attributes" do
    scenario "category invalid without a name" do
      category = Category.new

      expect(category).to be_invalid
    end

    scenario "invalid with same name" do
      cat_1 = Category.create(name: "New")
      cat_2 = Category.create(name: "New")

      expect(cat_1).to be_valid
      expect(cat_2).to be_invalid
    end
  end
end
