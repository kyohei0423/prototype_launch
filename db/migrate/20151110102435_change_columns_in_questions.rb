class ChangeColumnsInQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :user_id, :integer
    add_reference :questions, :user, index: true
  end
end
