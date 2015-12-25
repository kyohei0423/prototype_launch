class AddPrivateToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :private, :boolean, default: false, null: false
  end
end
