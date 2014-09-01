require 'spec_helper'

describe EacPerson do
  it { should have_many :names }
  it { should validate_presence_of :archival_record_identifier }
end