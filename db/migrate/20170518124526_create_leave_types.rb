class CreateLeaveTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :leave_types do |t|
  	 	t.string :name
  	 	t.string :description
  	 	t.boolean :active, :default => false
  	 	t.timestamps null: false
    end
  end
end
