class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string  :demo
      t.string  :name
      t.string  :status
      t.decimal :amount
      t.string  :currency
      t.text    :description
      t.string  :merchant_name
      t.string  :category
      t.boolean :refunded
      t.decimal :account_balance
      t.string  :request_longitude
      t.string  :request_latitude
      t.string  :request_address
      t.string  :network_type
      t.string  :network_ip
      t.string  :network_operator
      t.string  :wireless_access_point
      t.string  :status
      t.boolean :livemode, :default => true
      t.integer :account_id
      t.timestamps null: false
    end
  end
end
