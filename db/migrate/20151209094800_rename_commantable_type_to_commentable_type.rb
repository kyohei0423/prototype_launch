class RenameCommantableTypeToCommentableType < ActiveRecord::Migration
  def change
    rename_column :comments, :commantable_type, :commentable_type
  end
end
