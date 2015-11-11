class AddColumnsToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :question, index: true, foreign_key: true
    add_reference :answers, :user, index: true, foreign_key: true
  end
end
