class AddDefaultValueToPoints < ActiveRecord::Migration
  def up
    change_column :user_rankings, :points, :integer, default: 0
  end

  def down
    change_column :user_rankings, :points, :integer, default: nil
  end
end
