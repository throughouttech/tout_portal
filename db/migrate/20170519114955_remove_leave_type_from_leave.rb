class RemoveLeaveTypeFromLeave < ActiveRecord::Migration[5.0]
  def change
    remove_column :leaves, :leave_type, :integer
    add_column :leaves, :leave_type_id, :integer
  end
end
