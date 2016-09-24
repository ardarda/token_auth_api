class Work < ApplicationRecord
  belongs_to :user
  belongs_to :employer
  has_many :work_pieces
end
