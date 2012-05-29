class CreateEmployeeprojects < ActiveRecord::Migration
  def change
    create_table :employeeprojects do |t|
      t.integer :employee_id
      t.integer :project_id

      t.timestamps
    end
  end
end
