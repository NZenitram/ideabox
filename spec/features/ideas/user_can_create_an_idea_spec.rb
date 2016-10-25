require 'rails_helper'

describe "idea creation and retrieval" do
  scenario "a user can create an idea" do
    category = Category.new(title: "Category")
    idea = Idea.new(content: "Idea")

  end
end
