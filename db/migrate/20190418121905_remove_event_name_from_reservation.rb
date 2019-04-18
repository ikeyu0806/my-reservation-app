class RemoveEventNameFromReservation < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :event_name, :string
  end
end
