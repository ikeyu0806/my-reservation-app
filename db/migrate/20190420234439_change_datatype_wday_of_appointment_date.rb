class ChangeDatatypeWdayOfAppointmentDate < ActiveRecord::Migration[5.2]
  def change
    change_column :appointment_dates, :wday, :string, limit: 10
  end
end
