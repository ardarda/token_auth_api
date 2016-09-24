class WorkPieceSerializer < ActiveModel::Serializer
  attributes :id, :date, :piece_rate, :is_paid
  belongs_to :worker
  belongs_to :work
end
