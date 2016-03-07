require_relative "feature_helper"

describe "create todo lists", type: :feature do
  it "creates a post" do
    visit "/"
    click_on "Create a new Todolist"
    fill_in "title", with: "Test Todo"
    fill_in "body", with: "Test Todo Body"
    click_on "Create"
    expect(page).to have_content "Undone"
  end

  it "deletes a post" do
    visit "/"
    click_on "Create a new Todolist"
    fill_in "title", with: "Deleted Post"
    fill_in "body", with: "Test Todo Body"
    click_on "Create"
    expect(page).to have_content "Deleted Post"
    click_on "Delete", match: :first
    expect(page).to have_content "Deleted Post"
  end

  it "shows error for undefined page" do
    visit "/adebayo"
    expect(page).to have_content "Route not found"
  end
end
