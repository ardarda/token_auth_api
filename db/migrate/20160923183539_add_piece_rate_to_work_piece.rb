class AddPieceRateToWorkPiece < ActiveRecord::Migration[5.0]
  def change
  	add_column :work_pieces, :piece_rate, :decimal, :precision => 8, :scale => 2

  end
end
