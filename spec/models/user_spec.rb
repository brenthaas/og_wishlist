require 'spec_helper'
require 'rails_helper'

describe User do
  it { is_expected.to have_many :wishes }
end
