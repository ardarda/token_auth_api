class AddIsPaidToWorkPieces < ActiveRecord::Migration[5.0]
  def change
  	add_column :work_pieces, :is_paid, :boolean
  end
end
