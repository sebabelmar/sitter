class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.belongs_to :user

      t.integer :start_time
      t.integer :end_time
      t.integer :duration

      t.integer :availability, default: 1

      t.string :kind, default: "Sitter"

      t.timestamps
    end
  end
end