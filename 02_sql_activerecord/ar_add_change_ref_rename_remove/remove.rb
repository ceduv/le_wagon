class RemoveColumnFromTable < ActiveRecord::Migration[6.0]
    def change
      remove_column :table, :column, :type
    end
  end