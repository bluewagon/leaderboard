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

class Ranking < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :user_rankings
  has_many :users, through: :user_rankings

  validates :description, presence: true
  validates :name, presence: true

  # no spaces
  VALID_NAME_REGEX =  /^[a-zA-Z0-9-_]+$/


end
