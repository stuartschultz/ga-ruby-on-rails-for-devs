class Role < ActiveRecord::Base
  attr_accessible :name, :department
  validates_presence_of :name
  validates_presence_of :department
  has_many :employees
end
