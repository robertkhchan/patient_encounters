json.array!(@encounters) do |encounter|
  json.extract! encounter, :id, :visit_number, :admitted_at, :discharged_at, :location, :room, :bed, :patient_id
  json.url encounter_url(encounter, format: :json)
end
