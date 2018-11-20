class AppointmentsController < ApplicationController
  before_action :set_doctor
  def index

  end

  def new
  end

  def create
  end

  def destroy
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def appointment_params
      params.permit(:appointment).permit()
    end

end
