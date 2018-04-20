class AddShelfIdToPots < ActiveRecord::Migration[5.1]
  def change
    add_column :pots, :shelf_id, :integer
  end
end
