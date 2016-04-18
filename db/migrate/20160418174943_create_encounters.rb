class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :visit_number
      t.datetime :admitted_at
      t.datetime :discharged_at
      t.string :location
      t.string :room
      t.string :bed
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
