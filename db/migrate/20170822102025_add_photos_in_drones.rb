class AddPhotosInDrones < ActiveRecord::Migration[5.0]
  def change
    add_column :drones, :photos, :string, array: true
  end
end
