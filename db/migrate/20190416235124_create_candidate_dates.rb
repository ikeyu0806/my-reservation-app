class CreateCandidateDates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidate_dates do |t|
      t.date :candidate_date
      t.integer :event_id

      t.timestamps
    end
  end
end
