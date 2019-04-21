class AddIndexToAppointmentDate < ActiveRecord::Migration[5.2]
  def change
    add_index :appointment_dates, :event_id, unique: true
  end
end
