class ChangeRankToDoItems < ActiveRecord::Migration[5.2]
  def up
   change_column_default :to_do_items, :rank, 0
   change_column_null :to_do_items, :rank, false
  end

 def down
    change_column :to_do_items, :rank
 end

end
