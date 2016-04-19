require 'spec_helper'

describe Patient do
  it "has a valid factory" do
    FactoryGirl.build(:patient).should be_valid
  end

  it "is invalid without a first_name" do
    FactoryGirl.build(:patient, first_name: nil).should_not be_valid
  end

  it "is invalid without a last_name" do
    FactoryGirl.build(:patient, last_name: nil).should_not be_valid
  end

  it "is invalid without a MRN" do
    FactoryGirl.build(:patient, MRN: nil).should_not be_valid
  end

  it "does not allow duplicate MRN" do
    FactoryGirl.create(:patient, MRN: 'FakeMRN2')
    FactoryGirl.build(:patient, MRN: 'FakeMRN2').should_not be_valid
  end


end
