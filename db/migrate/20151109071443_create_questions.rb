class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :sentence
      t.integer :time_limit
      t.references :user

      t.timestamps null: false
    end
  end
end
