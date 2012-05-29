class Employee < ActiveRecord::Base
  attr_accessible :name, :address, :start_date
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :start_date
  belongs_to :role
  has_many :employeeprojects
  has_many :projects, :through => :employeeprojects
end
