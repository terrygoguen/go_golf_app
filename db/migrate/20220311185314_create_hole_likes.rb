class CreateHoleLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hole_likes do |t|
      t.integer :user_id
      t.integer :hole_id

      t.timestamps
    end
  end
end
