class CreateDeathCauses < ActiveRecord::Migration[7.0]
  def change
    create_table :death_causes do |t|
      t.string :name
      t.timestamps
    end
  end
end
