require 'spec_helper'

describe "search results" do

  it "should display titles based on a valid search" do
    login(user)
    click_link "Home"
    fill_in "Search for title:", with: "Seinfeld"
    expect(page).to have_content "Seinfeld"
  end
end

def login(user)
  visit root_path
  click_link "Log-in"
  fill_in "E-mail", with: "mbeaujean88@gmail.com"
  fill_in "Password", with: "123123123"
  click_button "Login"
end
