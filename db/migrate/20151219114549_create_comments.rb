class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :question
      t.text :text

      t.timestamps null: false
    end
  end
end
