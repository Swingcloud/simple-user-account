class CreateAccount < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :card_number
      t.string :name
      t.string :status
      t.float :balance
      t.boolean :livemode, :default => true
      t.timestamps null: false
    end
  end
end
