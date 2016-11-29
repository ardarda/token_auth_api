class CreateBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :balances do |t|
      t.decimal :Difference, :precision => 8, :scale => 2
      t.decimal :TotalIncome, :precision => 8, :scale => 2
      t.decimal :TotalExpenses, :precision => 8, :scale => 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
