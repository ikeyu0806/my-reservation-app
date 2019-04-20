class AppointmentDatesController < ApplicationController
  def new
    @appointment_date = AppointmentDate.new
  end

  def create
    @appointment_date = AppointmentDate.new(appointment_date_params)
    if @appointment_date.save
      redirect_to controller: :appointment_dates, action: :new
    else
      render 'new'
    end
  end

  private
  def appointment_date_params
    params.require(:appointment_date).permit(
      :from_date, :to_date, :excluded_date,
      :wday, :time, :date)
  end
end
