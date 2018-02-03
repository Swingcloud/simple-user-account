class AddDefaultValueOnAccount < ActiveRecord::Migration[5.1]
  def up
    change_column :accounts, :balance, :decimal, default: 0
    change_column :accounts, :status,  :string,  default: 'active'
  end

  def down
    change_column :accounts, :balance, :decimal
    change_column :accounts, :status,  :string
  end
end
