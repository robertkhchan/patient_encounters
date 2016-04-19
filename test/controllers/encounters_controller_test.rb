require 'test_helper'

class EncountersControllerTest < ActionController::TestCase
  setup do
    @encounter = encounters(:encounter_one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encounter" do
    assert_difference('Encounter.count') do
      post :create, encounter: { visit_number: @encounter.visit_number, admitted_at: @encounter.admitted_at, discharged_at: @encounter.discharged_at, location: @encounter.location, room: @encounter.room, bed: @encounter.bed }
    end

    assert_redirected_to patient_path(@encounter.patient)
  end

  test "should show encounter" do
    get :show, id: @encounter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @encounter
    assert_response :success
  end

  test "should update encounter" do
    patch :update, id: @encounter, encounter: { visit_number: @encounter.visit_number, admitted_at: @encounter.admitted_at, discharged_at: @encounter.discharged_at, location: @encounter.location, room: @encounter.room, bed: @encounter.bed }
    assert_redirected_to patient_path(@encounter.patient)
  end

  test "should destroy encounter" do
    @patient = @encounter.patient
    assert_difference('Encounter.count', -1) do
      delete :destroy, id: @encounter
    end

    assert_redirected_to patient_path(@patient)
  end
end
