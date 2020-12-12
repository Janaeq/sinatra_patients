class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
    end
    # should be able to add and remove doctors as they are employed / if they leave the practice
  end
end
