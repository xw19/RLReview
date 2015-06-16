class DropCategories < ActiveRecord::Migration
  def up
    drop_table :categories
  end

  def down
    create_table :categories do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
