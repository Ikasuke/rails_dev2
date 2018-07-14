class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail_address
      t.string :pass_word
      t.boolean :administrator
      t.boolean :state

      t.timestamps
    end
  end
end
