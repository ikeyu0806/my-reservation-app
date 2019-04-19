class RemoveExcludedDateFromAppointmentDates < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointment_dates, :excluded_date, :date
  end
end
