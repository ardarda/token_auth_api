class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable#,
          #:confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :works
  has_many :books
  has_many :employers

  has_one :balance
  
end
