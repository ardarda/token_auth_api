class WorkSerializer < ActiveModel::Serializer
  attributes :id, :name, :address
  belongs_to :employer
  has_many :work_pieces
end
