class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name
  validates_presence_of :name
  has_many :employeeprojects
  has_many :employees, :through => :employeeprojects
end
