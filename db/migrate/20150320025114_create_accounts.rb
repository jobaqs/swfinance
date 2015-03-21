class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :account_number
      t.string :account_name
      t.integer :user_id

      t.timestamps
    end
  end
end
