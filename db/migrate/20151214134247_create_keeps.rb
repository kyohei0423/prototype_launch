class CreateKeeps < ActiveRecord::Migration
  def change
    create_table :keeps do |t|
      t.references :user
      t.references :question

      t.timestamps null: false
    end
  end
end
