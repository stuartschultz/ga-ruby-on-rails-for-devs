class Project < ActiveRecord::Base

  attr_accessible :employees_count, :name
  
  has_many :employeeprojects
  has_many :employees, :through => :employeeprojects
  
  validates_presence_of :name
  # validates :employees_count, :numericality => { :greater_than => 0 }
#  validate :positive_employee_count
  
  before_validation :update_count

  def update_count
#    puts "# of employees: #{self.employees_count}"
#    puts "# in employees array: #{self.employees.count}"
    puts "and before: #{self.inspect}"
    self.employees_count = self.employees.count
    puts "and now: #{self.inspect}"
  end
  
  private 

#  def positive_employee_count
#    if employees_count <= 0
#      errors.add(:employees_count, "cannot be a negative number")
#    end
#  end

end
