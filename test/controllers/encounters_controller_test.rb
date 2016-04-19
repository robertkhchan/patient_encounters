require 'test_helper'

class EncountersControllerTest < ActionController::TestCase
  setup do
    @encounter = encounters(:encounter_one)
  end

  test "should get new" do
    get :new, patient_id: @encounter.patient
    assert_response :success
  end

  test "should create encounter" do
    assert_difference('Encounter.count') do
      post :create, patient_id: @encounter.patient, encounter: { visit_number: @encounter.visit_number, admitted_at: @encounter.admitted_at, discharged_at: @encounter.discharged_at, location: @encounter.location, room: @encounter.room, bed: @encounter.bed }
    end

    assert_redirected_to patient_path(@encounter.patient)
  end

  test "should show encounter" do
    get :show, patient_id: @encounter.patient, id: @encounter
    assert_response :success
  end

  test "should get edit" do
    get :edit, patient_id: @encounter.patient, id: @encounter
    assert_response :success
  end

  test "should update encounter" do
    patch :update, patient_id: @encounter.patient, id: @encounter, encounter: { visit_number: @encounter.visit_number, admitted_at: @encounter.admitted_at, discharged_at: @encounter.discharged_at, location: @encounter.location, room: @encounter.room, bed: @encounter.bed }
    assert_redirected_to patient_path(@encounter.patient)
  end

  test "should destroy encounter" do
    @patient = @encounter.patient
    assert_difference('Encounter.count', -1) do
      delete :destroy, patient_id: @encounter.patient, id: @encounter
    end

    assert_redirected_to patient_path(@patient)
  end
end
