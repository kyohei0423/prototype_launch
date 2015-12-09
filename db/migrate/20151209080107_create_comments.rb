class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, index: true
      t.string :commantable_type
      t.text :text
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
