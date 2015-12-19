class AddExPointToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ex_point, :integer, default: 0
    add_column :users, :level, :integer, default: 1
  end
end
