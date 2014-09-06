class AddAuthTokenToManager < ActiveRecord::Migration
  def change
    add_column :managers, :authentication_token, :string
  end
end
