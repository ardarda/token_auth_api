class WorkerSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email
  # belongs_to :user
  has_many :work_pieces
end
