# == Schema Information
#
# Table name: rankings
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Ranking do
  let(:ranking) { FactoryGirl.create(:ranking) }

  subject { ranking }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe "with blank name" do
    before { ranking.name = nil }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { ranking.description = nil }
    it { should_not be_valid }
  end
end
