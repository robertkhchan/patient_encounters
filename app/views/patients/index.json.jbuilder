json.array!(@patients) do |patient|
  json.extract! patient, :id, :first_name, :middle_name, :last_name, :weight, :height, :MRN
  json.url patient_url(patient, format: :json)
end
