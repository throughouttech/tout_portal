class CreateLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :leaves do |t|
  	 	t.references :leave_type
  	 	t.text :description
  	 	t.datetime :start_at
  	 	t.datetime :end_at
  	 	t.references :user
  	 	t.string :status, :default => "pending"
  	 	t.timestamps null: false
    end
  end
end
