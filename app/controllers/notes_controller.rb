class NotesController < ApplicationController

  before_action :set_note, only: [:show]
  before_action :set_patient
  before_action :set_user, only: [:new, :create]
  
  def index
    @notes = @patient.notes.order("created_at")
  end

  def show
    @patient = @note.patient.find(params[:id])
    @user = @note.user.find(params[:user_id])
  end

  def new
    @note = @patient.notes.new
  end

  def create
    @note = @patient.notes.new(note_params)
    if @note.save
      redirect_to @patient
    else
      render :new
    end
  end

  def destroy
    @note.destroy
    redirect_to @patient
  end

  private

    def set_user
      @user = current_user
    end

    def set_note
      @note = Note.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def note_params
      params.require(:note).permit(:message)
    end
end
