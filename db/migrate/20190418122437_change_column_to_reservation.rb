class ChangeColumnToReservation < ActiveRecord::Migration[5.2]
  def change
    change_column_null :reservations, :user_name, false
    change_column_null :reservations, :mail, false
    change_column_null :reservations, :phone_number, false
    change_column_null :reservations, :date, false
  end
end
