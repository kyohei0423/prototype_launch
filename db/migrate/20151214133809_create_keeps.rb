class CreateKeeps < ActiveRecord::Migration
  def change
    create_table :keeps do |t|
      t.references :question
      t.references :user

      t.timestamps null: false
    end
  end
end
