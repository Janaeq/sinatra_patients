class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :clinic_days
      t.string :clinic_location
      t.string :on_call_days
      t.integer :user_id
    end
    # should be able to add and remove doctors as they are employed / if they leave the practice
  end
end
