class ReservationController < ApplicationController

  def new
    @event_id = params[:event_id]
    @appointment_date = AppointmentDate.candidate_date(@event_id)
    @reservation = Reservation.new
    @appointment_dates = AppointmentDate.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save!
      redirect_to controller: :reservation, action: :new
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
