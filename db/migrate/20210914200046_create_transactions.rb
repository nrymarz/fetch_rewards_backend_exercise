class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :payer_id
      t.integer :points
      t.integer :user_id

      t.timestamps
    end
  end
end
