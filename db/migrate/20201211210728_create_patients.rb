class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name # Should be able to edit
      t.string :insurance # Should be able to edit
      t.string :diagnosis # Can dx be changed? I think so lol
      t.text :medications # Should be able to edit. How to get med list into array?
      t.integer :doctor_id
    end
  end
end
