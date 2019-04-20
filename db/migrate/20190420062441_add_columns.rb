class AddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :appointment_dates, :event_id, :bigint
    add_column :reservations, :event_id, :bigint
  end
end
