class AddColumnToExcludedDate < ActiveRecord::Migration[5.2]
  def change
    add_column :excluded_dates, :appointment_date_id, :bigint
  end
end
