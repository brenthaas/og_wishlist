require 'spec_helper'

describe Wish do
  describe "validations" do
    it { should validate_presence_of :title }
  end
end
