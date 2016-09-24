class CreateWorkPieces < ActiveRecord::Migration[5.0]
  def change
    create_table :work_pieces do |t|
      t.datetime :date
      t.references :worker, foreign_key: true
      t.references :work, foreign_key: true
      t.timestamps
    end
  end
end
