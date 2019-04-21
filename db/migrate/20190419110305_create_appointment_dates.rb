class CreateAppointmentDates < ActiveRecord::Migration[5.2]
  def change
    create_table :appointment_dates do |t|
      t.date :from_date, null: false
      t.date :to_date, null: false
      t.date :excluded_date

      t.timestamps
    end
  end
end
