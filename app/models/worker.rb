class Worker < ApplicationRecord
  belongs_to :user
  has_many :work_pieces
end
