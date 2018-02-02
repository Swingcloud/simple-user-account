class CreateUid < ActiveRecord::Migration[5.1]
  def up
    add_column :users,    :uid, :string
    add_column :accounts, :uid, :string
    add_column :payments, :uid, :string

    add_index :users,    :uid
    add_index :accounts, :uid
    add_index :payments, :uid
  end

  def down
    remove_column :users,    :uid, :string
    remove_column :accounts, :uid, :string
    remove_column :payments, :uid, :string

    remove_index :users,    :uid
    remove_index :accounts, :uid
    remove_index :payments, :uid
  end
end
