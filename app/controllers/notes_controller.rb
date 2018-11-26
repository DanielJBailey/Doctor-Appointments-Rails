class NotesController < ApplicationController

  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :set_patient
  
  def index
    @notes = @patient.notes.order("created_at")
  end

  def new
    @note = @patient.notes.new
  end

  def show
  end

  def create
    @note = @patient.notes.new(note_params)
    @note.update(user_id: current_user.id)
    if @note.save
      redirect_to @patient
    else
      render :new
    end
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to @patient
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to @patient
  end

   private

    def set_note
      @note = Note.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def note_params
      params.require(:note).permit(:message, :user_id)
    end
end

