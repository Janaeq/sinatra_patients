class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest # Use password digest to use bcrypt
    end
    # should be able to sign up as receptionists are employed
    # UN and PW should be authenticated to protect patient data
  end
end
