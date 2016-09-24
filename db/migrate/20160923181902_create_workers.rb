class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
