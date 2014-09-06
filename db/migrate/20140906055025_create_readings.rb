class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.string :name
      t.float :value
      t.timestamp :timestamp

      t.timestamps
    end
  end
end
