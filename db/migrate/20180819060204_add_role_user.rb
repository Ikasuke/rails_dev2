class AddRoleUser < ActiveRecord::Migration[5.2]
  def up
   add_column :users, :role, :integer, null:false, default: 0
  end

  def down
   remove_column :users, :role
  end

end
