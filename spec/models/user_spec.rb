require 'spec_helper'

describe User do
  it { should have_many(:playlists) }

  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:password).is_at_least(8).is_at_most(16) }
  it { should have_secure_password }

  it "must have unique e-mail" do
    user = User.create(
      name: "The Dude",
      email: "theresabeveragehereman@dude.com",
      password: "123123123",
      password_confirmation: "123123123"
      )
    expect(user).to validate_uniqueness_of(:email)
    user.destroy
  end
end

