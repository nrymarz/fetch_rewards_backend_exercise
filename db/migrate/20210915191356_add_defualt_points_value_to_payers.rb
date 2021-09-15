class AddDefualtPointsValueToPayers < ActiveRecord::Migration[6.1]
  def change
    remove_column :payers, :points
    add_column :payers, :points, :integer, default: 0
  end
end
