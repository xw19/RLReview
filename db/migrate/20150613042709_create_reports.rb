class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :reason
      t.integer :user_id
      t.references :reportable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
