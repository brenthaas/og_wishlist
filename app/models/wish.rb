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

class Wish < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
end
