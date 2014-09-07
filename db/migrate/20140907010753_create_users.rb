class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :family_name
      t.string :phone_number_one
      t.string :phone_number_two
      t.string :zip_code

      t.timestamps
    end
  end
end
