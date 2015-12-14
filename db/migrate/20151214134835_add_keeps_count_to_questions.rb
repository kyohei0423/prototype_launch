class AddKeepsCountToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :keeps_count, :integer, default: 0
  end
end
