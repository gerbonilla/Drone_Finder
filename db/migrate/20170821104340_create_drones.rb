class CreateDrones < ActiveRecord::Migration[5.0]
  def change
    create_table :drones do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :description
      t.integer :rate
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
