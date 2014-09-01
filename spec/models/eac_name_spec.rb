require "spec_helper"

describe EacName do
  it { should belong_to :eac_person }
  it { should validate_presence_of :text }
end