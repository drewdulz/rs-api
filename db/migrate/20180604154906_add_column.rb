class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :sensor_data, :sensor_id, :integer
  end
end
