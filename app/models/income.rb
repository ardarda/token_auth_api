class Income < ApplicationRecord
  belongs_to :work
  belongs_to :employer
  belongs_to :user
end
