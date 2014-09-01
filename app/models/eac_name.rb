class EacName < ActiveRecord::Base
  validates_presence_of :text
  belongs_to :eac_person
end