class IncomeSerializer < ActiveModel::Serializer
  attributes :id, :rate, :transaction_completed
  has_one :work
  has_one :employer
  has_one :user
end
