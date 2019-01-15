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

class UserRanking < ActiveRecord::Base
  attr_accessible :ranking_id, :user_id, :points, :admin

  belongs_to :user
  belongs_to :ranking

  validates :user_id, presence: true
  validates :ranking_id, presence: true
  validates :points, presence: true
  validates :admin, presence: true

end
