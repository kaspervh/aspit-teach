class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :role_id
      t.integer :school_id
      t.integer :grade_id

      t.timestamps
    end
  end
end
