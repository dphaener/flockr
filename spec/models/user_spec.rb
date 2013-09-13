require 'spec_helper'

describe User do
  context 'without an email address' do
    it 'fails validation' do
      expect(User.new).to have(1).error_on(:email)
    end
  end
  
  context 'email is not unique' do
    it 'fails validation' do
      user = User.create!(email: "me@stuff.com", username: "donald")
      expect(User.new(email: "me@stuff.com", username: "donald")).to have(1).error_on(:email)
    end
  end
  
  context 'without a username' do
    it 'fails validation' do
      expect(User.new).to have(1).error_on(:username)
    end
  end
  
  context 'username is not unique' do
    it 'fails validation' do
      user = User.create!(email: "me@stuff.com", username: "donald")
      expect(User.new(email: "me@stuff.com", username: "donald")).to have(1).error_on(:username)
    end
  end
  
  it 'can have many photos' do
    user = User.create!(email: "me@stuff.com", username: "donald")
    2.times { user.photos << Photo.new }
    expect(user).to be_valid
  end
end
