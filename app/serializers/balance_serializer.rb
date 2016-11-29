class BalanceSerializer < ActiveModel::Serializer
  attributes :id, :Difference, :TotalIncome, :TotalExpenses
  belongs_to :user
end
