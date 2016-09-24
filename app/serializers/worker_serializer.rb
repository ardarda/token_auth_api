class WorkerSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email
  # belongs_to :user
  # belongs_to :work_piece
end
