require_relative "feature_helper"

describe "visit all route with get request", type: :feature do
  it "visits homepage" do
    visit "/"
    expect(page).to have_content "My Todolist"
  end

  it "visits create new page" do
    visit "/lists/new"
    expect(page).to have_content "New Todo"
  end

  it "visits a certain todo list" do
    visit "/"
    click_on "Create a new Todolist"
    fill_in "title", with: "Test Todo"
    fill_in "body", with: "Test Todo Body"
    click_on "Create"
    click_on "Test Todo"
    expect(page).to have_content "Back"
  end
end
