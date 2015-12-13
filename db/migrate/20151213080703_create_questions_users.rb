class CreateQuestionsUsers < ActiveRecord::Migration
  def change
    create_table :questions_users do |t|
      t.references :user
      t.references :question
      t.integer :status

      t.timestamps null: false
    end
  end
end
