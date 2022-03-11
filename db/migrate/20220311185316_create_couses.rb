class CreateCouses < ActiveRecord::Migration[6.0]
  def change
    create_table :couses do |t|
      t.string :name
      t.string :address
      t.integer :phone_number
      t.integer :rating
      t.integer :handicap
      t.integer :longitude
      t.integer :latitude

      t.timestamps
    end
  end
end
