class ReservationController < ApplicationController
  before_action :get_candidate_dates

  def new
    @reservation = Reservation.new
    @appointment_dates = AppointmentDate.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to controller: :reservation, action: :new
    else
      render 'new'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :event_name, :user_name, :mail,
      :phone_number, :event_id)
  end

  def get_candidate_dates
    appointment_date = AppointmentDate.all
  end
end