require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :file_name => "MyString",
      :path => "MyString",
      :user_id => 1,
    ).as_new_record)
    
    assign(:user, stub_model(User,
      :user_id => 1,
      :username => "MyString",
      :email => "MyString@email.com"
    ).as_new_record)
  end

  it "renders new photo form" do
    render
    user = User.create!(user_id: 1, username: "MyString", email: "MyString@email.com")
    photo = Photo.create!(user_id: 1, path: "MyString", file_name: "MyString")
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_photos_path(user_id: 1), "post" do
      assert_select "input#photo_file_name[name=?]", "photo[file_name]"
      assert_select "input#photo_path[name=?]", "photo[path]"
    end
  end
end
