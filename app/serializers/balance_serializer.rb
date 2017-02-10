class BalanceSerializer < ActiveModel::Serializer
  attributes :id, :Difference, :TotalIncome, :TotalExpenses, :total_paid_expenses
  belongs_to :user
end
