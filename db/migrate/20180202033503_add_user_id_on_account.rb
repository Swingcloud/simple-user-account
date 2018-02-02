class AddUserIdOnAccount < ActiveRecord::Migration[5.1]
  def up
    add_column :accounts, :user_id, :integer
  end

  def down
    remove_column :accounts, :user_id
  end
end
