class AddDriverToReading < ActiveRecord::Migration
  def change
    add_reference :readings, :driver, index: true
  end
end
