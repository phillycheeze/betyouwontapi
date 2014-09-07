class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.float :speed
      t.float :rpm
      t.float :odometer
      t.float :longitude
      t.float :latitude
      t.timestamp :timestamp

      t.timestamps
    end
  end
end
