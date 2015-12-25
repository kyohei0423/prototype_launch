class AddThanksToUser < ActiveRecord::Migration
  def change
    add_column :users, :thanks, :integer, default: 0
  end
end
