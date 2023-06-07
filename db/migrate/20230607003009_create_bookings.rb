class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chair, null: false, foreign_key: true
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end
