class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :user_type
      t.date :dob
      t.string :ice_cream

      t.timestamps
    end
  end
end
