# == Schema Information
#
# Table name: wishes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  summary    :text
#  url        :text
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require 'spec_helper'

describe Wish do
  describe "validations" do
    it { should validate_presence_of :title }
  end
end
