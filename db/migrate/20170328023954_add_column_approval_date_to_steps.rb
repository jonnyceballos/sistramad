class AddColumnApprovalDateToSteps < ActiveRecord::Migration[5.0]
  def change
    add_column :steps, :approved_at, :datetime
  end
end
