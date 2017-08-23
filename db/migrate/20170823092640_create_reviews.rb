class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :booking, foreign_key: true
      t.integer :rating
      t.string :title
      t.text :content
      t.string :type

      t.timestamps
    end
  end
end
