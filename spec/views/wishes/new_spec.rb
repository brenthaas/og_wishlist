require 'spec_helper'

describe "/wishes/new.html.slim" do
  context "when a user is logged in" do
    before (:each) do
      assign(:wish, stub_model(Wish) )
      @user = stub_model(User)
      allow(view).to receive(:current_user).and_return(@user)
    end

    it "makes a hidden field with the user id" do
      render
      expect(rendered).to match /input .*value="\d+" .*type="hidden" .*id="user_id"/
    end
  end
end
