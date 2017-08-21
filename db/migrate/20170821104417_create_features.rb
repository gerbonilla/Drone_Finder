class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
      t.references :drone, foreign_key: true
      t.string :category
      t.integer :max_alt
      t.string :range
      t.string :battery_life

      t.timestamps
    end
  end
end
