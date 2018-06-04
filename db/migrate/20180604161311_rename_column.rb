class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :sensors, :type, :sensor_type
  end
end
