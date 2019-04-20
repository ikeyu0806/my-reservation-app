class ReservationController < ApplicationController
  MAX_DISPLAY = 5

  def new
    @event_id = params[:event_id]
    @appointment_date = AppointmentDate.candidate_date(@event_id).take(MAX_DISPLAY)
    @reservation = Reservation.new
    @appointment_dates = AppointmentDate.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save!
      redirect_to controller: :events, action: :index
    else
      render 'new'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :user_name, :mail, :phone_number, :event_id, :date)
  end
end
