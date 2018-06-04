class RenameTimestampColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :sensor_data, :timeStamp, :time_stamp
  end
end
