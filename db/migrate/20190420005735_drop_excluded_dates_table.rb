class DropExcludedDatesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :excluded_dates
  end
end
