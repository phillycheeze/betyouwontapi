class AddRatingAndAlertToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :rating, :float
    add_column :drivers, :alert, :string
  end
end
