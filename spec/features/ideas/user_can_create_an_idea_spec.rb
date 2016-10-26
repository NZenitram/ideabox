require 'rails_helper'

describe "idea creation and retrieval" do
  scenario "a user can create an idea" do
    category = Category.create(name: "Category")
    idea = Idea.new(content: "Idea")

    visit categories_path

    click_on "Contribute an Idea"
    fill_in :Name, with: "Idea"
    fill_in :Content, with: "Content"
    click_on "Create Idea"

    expect(page).to have_content("Idea")
  end
  scenario "a user can delete ideas" do
    user = User.create(username: "Bob", password: "pass")
    category = Category.create(name: "Category")
      idea = Idea.create(name: "Good", content: "Idea", category_id: category.id, user_id: user.id)
      idea_1 = Idea.create(name: "Bad", content: "Idea", category_id: category.id, user_id: user.id)

      visit category_path(category)
      click_on "Bad"
      click_on "Delete"

      expect(page).to_not have_content("Bad")
  end
  scenario "a user can edit ideas" do
    user = User.create(username: "Bob", password: "pass")
    category = Category.create(name: "Category")
      idea = Idea.create(name: "Good", content: "Idea", category_id: category.id, user_id: user.id )
      idea_1 = Idea.create(name: "Bad", content: "Idea", category_id: category.id, user_id: user.id)

      visit category_path(category)
      click_on "Bad"
      click_on "Edit"


      expect(page).to_not have_content("Bad")
  end
end

describe "ideas show page will display data through categories" do
  scenario "a categories' idea show page displays contents" do
    user = User.create(username: "Bob", password: "pass")
    category = Category.create(name: "Category")
    idea = Idea.create(name: "Idea", content: "Content", category_id: category.id, user_id: user.id)

    visit category_path(category)
    click_on "Idea"

    expect(page).to have_content("Content")
  end
end
