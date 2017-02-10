class AddTotalPaidExpensesToBalance < ActiveRecord::Migration[5.0]
  def change
    add_column :balances, :total_paid_expenses, :decimal, :precision => 8, :scale => 2
  end
end
