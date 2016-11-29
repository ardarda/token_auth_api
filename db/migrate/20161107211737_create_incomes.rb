class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.decimal :rate, :precision => 8, :scale => 2
      t.references :work, foreign_key: true
      t.references :employer, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :transaction_completed

      t.timestamps
    end
  end
end
