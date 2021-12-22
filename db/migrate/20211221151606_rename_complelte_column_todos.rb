class RenameComplelteColumnTodos < ActiveRecord::Migration[6.1]
  def change
    rename_column :todos, :complelte, :completed
  end
end
