class RemoveReasonFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :reason, :string
  end
end
