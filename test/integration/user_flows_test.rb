require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  fixtures :all


  test "try to create a new patient" do
    get '/patients/new'
    assert_response :success

    post_via_redirect "/patients", :patient => { :first_name => "First", :last_name => "Last", :MRN => "SomeID" }
    assert_equal '/patients', path
    assert_select 'td', "SomeID"
    assert_select 'td', "First"
    assert_select 'td', "Last"
  end


  test "try to fill in discharged_at for an existing patient encounter" do
    @encounter = encounters(:encounter_one)
    get patient_path(@encounter.patient)
    assert_response :success

    get edit_patient_encounter_path(@encounter.patient, @encounter)
    assert_response :success

    put_via_redirect patient_encounter_path(@encounter.patient, @encounter), patient_id: @encounter.patient, encounter: {discharged_at: '2016-04-19 00:00:00', visit_number: @encounter.visit_number, admitted_at: @encounter.admitted_at, location: @encounter.location, room: @encounter.room, bed: @encounter.bed}
    assert_select 'td', '2016-04-19 00:00:00 UTC'
  end


end
