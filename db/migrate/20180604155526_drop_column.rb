class DropColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :sensor_data, :time_stamp
  end
end
