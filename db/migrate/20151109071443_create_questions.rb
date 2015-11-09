class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :sentence
      t.integer :time_limit
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
