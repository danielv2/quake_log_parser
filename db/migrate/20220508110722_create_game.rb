class CreateGame < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :total_kills, default: 0
      t.timestamps
    end
  end
end
