class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :username
      t.integer :longitude
      t.integer :latitude

      t.timestamps
    end
  end
end
