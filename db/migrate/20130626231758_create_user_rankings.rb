class CreateUserRankings < ActiveRecord::Migration
  def change
    create_table :user_rankings do |t|
      t.integer :user_id
      t.integer :ranking_id
      t.integer :points

      t.timestamps
    end

    add_index :user_rankings, :user_id
    add_index :user_rankings, :ranking_id
    add_index :user_rankings, [:user_id, :ranking_id], unique: true

  end
end
