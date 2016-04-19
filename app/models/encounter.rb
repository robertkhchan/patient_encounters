class Encounter < ActiveRecord::Base
  validates :visit_number,    :presence => true, uniqueness: { scope: :patient_id }
  validates :admitted_at,     :presence => true

  belongs_to :patient

end
