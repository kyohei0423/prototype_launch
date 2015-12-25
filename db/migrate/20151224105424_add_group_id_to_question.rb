class AddGroupIdToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :group, index: true, foreign_key: true
  end
end
