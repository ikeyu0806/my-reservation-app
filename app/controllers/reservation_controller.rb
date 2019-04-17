class ReservationController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :event_name, :user_name, :mail,
      :phone_number, :date)
  end
end