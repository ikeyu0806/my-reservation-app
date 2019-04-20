class AddColumnsToAppointmentDate < ActiveRecord::Migration[5.2]
  def change
    add_column :appointment_dates, :excluded_date, :date
    add_column :appointment_dates, :day, :string
    add_column :appointment_dates, :time, :time
  end
end
