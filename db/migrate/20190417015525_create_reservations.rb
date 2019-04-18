class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :event_name
      t.string :user_name
      t.string :mail
      t.string :phone_number
      t.date :date

      t.timestamps
    end
  end
end
