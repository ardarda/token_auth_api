class WorkPiecePreviewSerializer < ActiveModel::Serializer
  attributes :date, :piece_rate, :is_paid
  attributes :worker
  has_one :worker, serializer: WorkerSerializer
end
