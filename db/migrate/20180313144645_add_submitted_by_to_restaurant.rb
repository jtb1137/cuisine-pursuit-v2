class AddSubmittedByToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :submitted_by, :integer
  end
end
