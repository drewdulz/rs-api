class CreateSensorData < ActiveRecord::Migration[5.1]
  def change
    create_table :sensor_data do |t|
      t.float :value
      t.datetime :timeStamp

      t.timestamps
    end
  end
end
