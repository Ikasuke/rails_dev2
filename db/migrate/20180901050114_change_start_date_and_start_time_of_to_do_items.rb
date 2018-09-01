class ChangeStartDateAndStartTimeOfToDoItems < ActiveRecord::Migration[5.2]
  def up
    change_column :to_do_items, :start_date, :datetime
    remove_column :to_do_items, :start_time
    rename_column :to_do_items, :start_date, :start_at
  end

  def down
    rename_column :to_do_items, :start_at, :start_date
       add_column :to_do_items, :start_time, :time
    change_column :to_do_items, start_date, :datetime
  end
end
