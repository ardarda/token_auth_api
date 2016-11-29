class WorkSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :price
  belongs_to :employer
  has_many :work_pieces
end
