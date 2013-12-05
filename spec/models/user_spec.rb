require 'spec_helper'

describe User do
  it { should have_many :wishes }
  it "has a valid factory" do
    user = FactoryGirl.create :user
    user.should be_valid
  end
end
