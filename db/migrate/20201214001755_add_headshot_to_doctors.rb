class AddHeadshotToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :headshot, :string
  end
end
