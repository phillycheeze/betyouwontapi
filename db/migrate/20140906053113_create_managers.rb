class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :email
      t.string :password_digest
      t.string :full_name

      t.timestamps
    end
  end
end
