require 'spec_helper'

describe Encounter do

  it "does not allow duplicate visit number per patient" do
    patient = FactoryGirl.create(:patient)
    FactoryGirl.create(:encounter, patient: patient, visit_number: 'VN00001')
    FactoryGirl.build(:encounter, patient: patient, visit_number: 'VN00001').should_not be_valid
  end

end
