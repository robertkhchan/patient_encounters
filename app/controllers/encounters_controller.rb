class EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]

  def show
  end


  def new
    @patient = Patient.find(params[:patient_id])
    @encounter = @patient.encounters.build
  end


  def edit
  end


  def create
    @patient = Patient.find(params[:patient_id])
    @encounter = @patient.encounters.build(encounter_params)

    respond_to do |format|
      if @encounter.save
        format.html { redirect_to patient_path(@patient), notice: 'Encounter was successfully created.' }
      else
        format.html {render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @encounter.update(encounter_params)
        format.html { redirect_to patient_path(@encounter.patient), notice: 'Encounter was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @patient_id = @encounter.patient_id
    @encounter.destroy
    redirect_to patient_path(@patient_id)
  end

  private
     # Use callbacks to share common setup or constraints between actions.
    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

   def encounter_params
      params.require(:encounter).permit(:visit_number, :admitted_at, :discharged_at, :location, :room, :bed)
    end
end
