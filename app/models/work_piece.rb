class WorkPiece < ApplicationRecord
  belongs_to :worker
  belongs_to :work
end
