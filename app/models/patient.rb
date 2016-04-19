class Patient < ActiveRecord::Base
  validates :first_name,    :presence => true
  validates :last_name,     :presence => true
  validates :MRN,           :presence => true

  has_many :encounters,     :dependent => :delete_all
end
