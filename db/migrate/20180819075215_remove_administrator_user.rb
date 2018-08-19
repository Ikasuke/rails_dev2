class RemoveAdministratorUser < ActiveRecord::Migration[5.2]
  def up
      remove_column :users, :administrator
  end

  def down
      add_column :users, :administrator, :boolean, null:false, default: 0
  end
end
