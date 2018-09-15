class AddCompleteToDoItems < ActiveRecord::Migration[5.2]
  def up
      add_column :to_do_items, :complete, :boolean, null:false, default: 0
  end

  def down
    remove_column :to_do_items, :complete
  end

end
