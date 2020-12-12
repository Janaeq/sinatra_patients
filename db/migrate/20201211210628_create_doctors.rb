class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :username
      t.string :password_digest # Use password digest to use bcrypt
    end
  end
end
