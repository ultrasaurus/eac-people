class CreateEacPeople < ActiveRecord::Migration
  def change
    create_table :eac_people do |t|
      t.string :archival_record_identifier
      t.text :biography

      t.timestamps
    end
  end
end
