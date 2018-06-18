class RenameShelfTitileColumnToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :shelves, :title, :name
  end
end
