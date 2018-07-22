class CreateToDoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :to_do_items do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.string :place
      t.text :memo
      t.string :attachment
      t.integer :rank
      t.boolean :remind, default: false, null: false 
      t.timestamp :remind_time

      t.timestamps
    end
  end
end
