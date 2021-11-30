class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true
      t.string :payment_method
      t.integer :total_price
      t.date :start_date
      t.date :end_date
      t.string :status, default: "false"

      t.timestamps
    end
  end
end
