require 'rails_helper'

describe "user functionality" do
  scenario "a user can create a new category" do
    Category.create(name: "New")

    visit new_category_path

    fill_in :Name, with: "New"
    click_on "Create Category"

    expect(page).to have_content("New")
  end

  scenario "a user can edit a category" do
    category = Category.create(name: "New")

    visit category_path(category)

    click_on "Edit Category"
    fill_in :Name, with: "Next"
    click_on "Update Category"

    expect(page).to have_content("Next")
  end

  scenario "a user can see a list of available categories" do
    cat_1 = Category.create(name: "New")
    cat_2 = Category.create(name: "Next")

    visit categories_path

    expect(page).to have_content("New")
    expect(page).to have_content("Next")
  end

    scenario "a user can delete a category" do
    cat_1 = Category.create(name: "Stop")
    cat_2 = Category.create(name: "Next")

    visit category_path(cat_1)

    click_on "Delete"

    expect(page).to_not have_content("Stop")
    expect(page).to have_content("Next")
  end
end
