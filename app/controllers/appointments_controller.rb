class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]
  before_action :set_doctor
  def index
    @appointments = Appointment.all.order("date")
  end

  def show
    @patient = @appointment.patient.find(params[:id])
    @doctor = @appointment.doctor.find(params[:doctor_id])
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path
    else
      render :new
    end
  end

  def destroy
    @doctor.appointments.find(params[:id]).destroy
    redirect_to doctor_appointments_path
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.permit(:appointment).permit(:patient_id)
    end

end
