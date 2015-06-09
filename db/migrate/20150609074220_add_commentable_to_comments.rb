class AddCommentableToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentable_id, :intger
    add_column :comments, :commentable_type, :string
    add_index :comments, :commentable_id
    remove_column :comments, :post_id, :integer
  end
end
