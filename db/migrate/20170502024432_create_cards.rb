class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :player
      t.integer :rarity
      t.integer :offense
      t.integer :defense
      t.integer :special
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
