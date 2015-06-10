class CommentBodyColumnTypeChange < ActiveRecord::Migration
  def change
    remove_column :comments, :body, :string
    add_column :comments, :body, :text
  end
end
