class Employer < ApplicationRecord
	has_many :works
	belongs_to :user
end
