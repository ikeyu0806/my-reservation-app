class AddReservationIdToAppointmentDate < ActiveRecord::Migration[5.2]
  def change
    add_column :appointment_dates, :reservation_id, :bigint
    add_foreign_key :appointment_dates, :reservations, column: :reservation_id
  end
end
