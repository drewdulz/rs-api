class AddPotIdToPlants < ActiveRecord::Migration[5.1]
  def change
    add_column :plants, :pot_id, :integer
  end
end
