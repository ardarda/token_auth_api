class ChangeTotalPaidExpensesInBalance < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :balances, :total_paid_expenses, 0
  end
end
