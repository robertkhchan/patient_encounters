require 'test_helper'

class EncounterTest < ActiveSupport::TestCase

  def valid_params 
    { visit_number: "000001", admitted_at: Time.utc(2016,4,18,0,0,30) }
  end

  test "valid encounter" do
    encounter = Encounter.new(valid_params)
    assert encounter.valid?, "Can't create with valid params: #{encounter.errors.messages}"
  end

  test "invalid without visit_number" do
    params = valid_params.clone
    params.delete :visit_number
    encounter = Encounter.new(params)

    refute encounter.valid?, "Can't be valid without visit_number"
    assert encounter.errors[:visit_number], "Missing error when without visit_number"
  end

  test "invalid without admitted_at" do
    params = valid_params.clone
    params.delete :admitted_at
    encounter = Encounter.new(params)

    refute encounter.valid?, "Can't be valid without admitted_at"
    assert encounter.errors[:admitted_at], "Missing error when without admitted_at"
  end


end
