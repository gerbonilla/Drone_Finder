class DropFeaturesTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :features
  end
end
