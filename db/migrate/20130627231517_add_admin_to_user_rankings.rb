class AddAdminToUserRankings < ActiveRecord::Migration
  def change
    add_column :user_rankings, :admin, :boolean, default: false
  end
end
