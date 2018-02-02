class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :telephone_number
      t.boolean :admin, :default => false
      t.timestamps null: false
    end
  end
end
