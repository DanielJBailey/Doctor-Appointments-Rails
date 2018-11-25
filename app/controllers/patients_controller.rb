class PatientsController < ApplicationController
  before_action :set_patient, only: [:show,:destroy]
  def index
    @patients = Patient.all.order("last_name")
  end

  def show
    @appointments = @patient.appointments.order("date", "time")
    @notes = @patient.notes.all.order("created_at")
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      age = Date.today.year - @patient.dob.year
      @patient.update(age: age)
      redirect_to @patient
    else
      render :new
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end
  
  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :age, :dob, :language, :sex, :phone, :street, :city, :state, :zip)
    end
end
