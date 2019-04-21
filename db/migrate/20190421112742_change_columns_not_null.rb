class ChangeColumnsNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :appointment_dates, :wday, :string, null: false
    change_column :appointment_dates, :time, :time, null: false
    change_column :appointment_dates, :event_id, :bigint, null: false
  end
end
