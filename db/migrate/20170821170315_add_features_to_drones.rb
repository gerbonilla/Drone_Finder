class AddFeaturesToDrones < ActiveRecord::Migration[5.0]
  def change
    add_column :drones, :category, :string
    add_column :drones, :max_alt, :integer
    add_column :drones, :range, :string
    add_column :drones, :battery_life, :string
  end
end
