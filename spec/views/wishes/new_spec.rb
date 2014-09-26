require 'spec_helper'

describe "/wishes/new.html.erb" do
  context "when a user is logged in" do
    before (:each) do
      assign(:wish, stub_model(Wish) )
      @user = stub_model(User)
      allow(view).to receive(:current_user).and_return(@user)
    end
    it "makes a hidden field with the user id" do
      render
      expect(rendered).to match /<input id="user_id".*type="hidden" value="\d+"/
    end
  end
end
