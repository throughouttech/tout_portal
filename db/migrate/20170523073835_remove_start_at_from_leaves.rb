class RemoveStartAtFromLeaves < ActiveRecord::Migration[5.0]
  def change
  	remove_column :leaves, :start_at, :datetime
  	remove_column :leaves, :end_at, :datetime
  	add_column :leaves, :start_at, :date
  	add_column :leaves, :end_at, :date
  	add_column :leaves, :leave_for, :string, :default => "Full day"
  end
end
