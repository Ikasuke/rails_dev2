class ChangeEndDateAndEndTimeOfToDoItems < ActiveRecord::Migration[5.2]
  def up
    change_column :to_do_items, :end_date, :datetime
    remove_column :to_do_items, :end_time
    rename_column :to_do_items, :end_date, :end_at
  end

  def down
    rename_column :to_do_items, :end_at, :end_date
       add_column :to_do_items, :end_time, :time
    change_column :to_do_items, end_date, :datetime
  end
end
