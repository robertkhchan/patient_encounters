class Encounter < ActiveRecord::Base
  validates :visit_number,    :presence => true
  validates :admitted_at,     :presence => true

  belongs_to :patient
end
