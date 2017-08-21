class AddPhotoToDrone < ActiveRecord::Migration[5.0]
  def change
    add_column :drones, :photo, :string
  end
end
