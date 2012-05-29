class Employeeproject < ActiveRecord::Base
  attr_accessible :employee_id, :project_id
  validates_presence_of :employee_id
  validates_presence_of :project_id
  belongs_to :employee
  belongs_to :project
end
