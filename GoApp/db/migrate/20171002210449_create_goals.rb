class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :body
      t.string :title
      t.boolean :public, default: true
      t.boolean :completed, default: false
      t.integer :user_id


      t.timestamps
    end
  end
end
