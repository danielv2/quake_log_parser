class CreateJoinTableDeathCausesGames < ActiveRecord::Migration[7.0]
  def change
    create_join_table :games, :death_causes do |t|
      t.primary_key :id
      t.integer :quantity, default: 0
    end
  end
end
