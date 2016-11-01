class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :rate
      t.references :work_piece, foreign_key: true
      t.references :work, foreign_key: true
      t.boolean :transaction_completed

      t.timestamps
    end
  end
end
