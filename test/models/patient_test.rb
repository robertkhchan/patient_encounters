require 'test_helper'

class PatientTest < ActiveSupport::TestCase

  test "should not save patient until all required fields are populated" do
    patient = Patient.new
    assert_not patient.save

    patient.first_name = 'firstName'
    assert_not patient.save

    patient.last_name = 'lastName'
    assert_not patient.save

    patient.MRN = '000001'
    assert patient.save
  end

end
