class EacPerson < ActiveRecord::Base
  validates_presence_of :archival_record_identifier
  has_many :names, class_name: EacName
end