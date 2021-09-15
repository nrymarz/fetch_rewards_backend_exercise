class RemoveTimeFromPayersAndAddTimeToTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_column :payers, :time
    add_column :transactions, :time, :datetime
  end
end
