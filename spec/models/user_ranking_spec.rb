# == Schema Information
#
# Table name: user_rankings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  ranking_id :integer
#  points     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin      :boolean          default(FALSE)
#

require 'spec_helper'

describe UserRanking do
  let(:user) { FactoryGirl.create(:user) }
  let(:ranking) { FactoryGirl.create(:ranking) }
  let(:user_rank) { user.user_rankings.build(ranking_id: ranking.id) }

  subject { user_rank }

  describe 'user ranking methods' do
    it { should respond_to(:user) }
    it { should respond_to(:ranking) }
    it { should respond_to(:points) }
    it { should respond_to(:admin) }
    its(:user) { should == user }
    its(:ranking) { should == ranking }
    its(:points) { should == 0 }
    its(:admin) { should == false }
  end

  describe 'when user id is not present' do
    before { user_rank.user_id = nil }
    it { should_not be_valid }
  end

  describe 'when ranking id is not present' do
    before { user_rank.ranking_id = nil }
    it { should_not be_valid }
  end

  describe "when points is not present" do
    before { user_rank.points = nil }
    it { should_not be_valid }
  end

  describe "wehen admin is not present" do
    before { user_rank.admin = nil }
    it { should_not be_valid }
  end
end
