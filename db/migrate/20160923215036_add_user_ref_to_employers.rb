class AddUserRefToEmployers < ActiveRecord::Migration[5.0]
  def change
    add_reference :employers, :user, foreign_key: true
  end
end
