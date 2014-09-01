require 'csv'

namespace :import do

  desc "import files: data/eac"
  task eac: :environment do
    filenames = Dir[Rails.root.join("data/eac/*.xml")]
    puts "#{filenames.length} EAC files found"
    filenames.each do |filename|
      begin
        person = EAC(File.read(filename))
        bio = '<p>' + person.biography.notes.join('</p><p>') + '</p>'
        eac_person = EacPerson.new(archival_record_identifier: person.record_id, biography: bio)
        person.names.each do |eac_name|
          eac_person.names.build(text: eac_name.to_s)
        end
        eac_person.save!
        puts "SUCCESSFULLY MADE PERSON FROM #{filename}"
      rescue Exception => e
        puts "#{filename} : #{e.message}"
      end
    end

  end

end
