class CreateJoinTableGamesPlayers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :games, :players do |t|
      t.primary_key :id
      t.integer :kills, default: 0
    end
  end
end
