class AddForeignKeyForEvent < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :reservations, :events, column: :event_id
    add_foreign_key :appointment_dates, :events, column: :event_id
  end
end
