require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.build(:user,
      username: "Rabbit",
      password: "notpassword"
    )
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:session_token)}

  # it { should validate_presence_of :password}

  describe "#reset_session_token!" do
   it "should change the session token" do
     old_token = user.session_token
     user.reset_session_token!
     expect(user.session_token).not_to eq(old_token)
   end

    it "should return the session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
  end
 end

  describe "#is_password?" do
    it  "should return true if password is correct" do
      expect(user.is_password?("notpassword")).to be true
   end
   it  "should return false if password is incorrect" do
     expect(user.is_password?("$$password")).to be false
   end
  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "should return a user if the credentials are valid" do
      expect(User.find_by_credentials("Rabbit", "notpassword")).to eq(user)
    end


  end


end
