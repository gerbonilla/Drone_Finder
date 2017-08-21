class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :drone, foreign_key: true
      t.string :status
      t.date :start_date
      t.date :end_date
      t.integer :original_rate

      t.timestamps
    end
  end
end
