class Expense < ApplicationRecord
  belongs_to :work_piece
  belongs_to :work
  belongs_to :user

end
