class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :rate, :transaction_completed
  has_one :work_piece
  has_one :work
end
