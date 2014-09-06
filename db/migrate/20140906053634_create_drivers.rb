class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :token
      t.references :manager, index: true

      t.timestamps
    end
  end
end
