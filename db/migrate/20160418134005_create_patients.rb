class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name, :null => false
      t.string :middle_name
      t.string :last_name, :null => false
      t.float :weight
      t.float :height
      t.string :MRN,  :null => false

      t.timestamps null: false
    end
  end
end
