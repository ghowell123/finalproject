class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :activity
      t.time :time
      t.integer :user_id
      t.string :username

      t.timestamps
    end
  end
end
