class ChangeTypesInDrones < ActiveRecord::Migration[5.0]
  def change
    change_column :drones, :max_alt, :integer
    change_column :drones, :range, :integer
    change_column :drones, :battery_life, :integer
  end
end
