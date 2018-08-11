class RemoveMailaddressPasswordToUsers < ActiveRecord::Migration[5.2]

  def up
      remove_column :users, :mail_address
      remove_column :users, :pass_word
  end

  def down
    add_column :users, :mail_address, :string
    add_column :users, :pass_word, :string
  end

end
