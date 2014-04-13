require 'spec_helper'

describe "the playlists" do

  describe "creating a new playlist" do
    it "should redirect to the root path after creating a playlist" do
      login(user)
      click_link "Make a playlist"
      fill_in "Capybara's Playlist"
      expect(current_path).to eq root_path
    end
  end
end

def login(user)
  visit root_path
  click_link "Log-in"
  fill_in "E-mail", with: "mbeaujean88@gmail.com"
  fill_in "Password", with: "123123123"
  click_button "Login"
end
