class CreateEacNames < ActiveRecord::Migration
  def change
    create_table :eac_names do |t|
      t.string :text
      t.references :eac_person
      t.timestamps
    end
  end
end
