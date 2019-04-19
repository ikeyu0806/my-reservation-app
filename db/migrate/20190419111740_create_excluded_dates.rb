class CreateExcludedDates < ActiveRecord::Migration[5.2]
  def change
    create_table :excluded_dates do |t|
      t.date :excluded_date

      t.timestamps
    end
  end
end
