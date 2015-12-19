class AddLevelToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :level, :integer, default: 5
  end
end
