class ReservationController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to controller: :reservation, action: :new
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :event_name, :user_name, :mail,
      :phone_number, :date)
  end
end