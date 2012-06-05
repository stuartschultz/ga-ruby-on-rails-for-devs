require 'spec_helper'

describe Project do

  context "validations" do
    it { should validate_presence_of :name }
  end

  context "associations" do
    it { should have_many :employeeprojects }
    it { should have_many(:employees).through(:employeeprojects) }
  end

  context "callbacks" do
    before :each do
      @project = Project.create!(name: "gamma")
    end
    it "should update employee count" do
      # expect {@project.employees << Fabricate(:employee)}.to change{@project.employees_count}.by(1)
      @project.employees << Fabricate(:employee)
      puts @project.inspect
    end
  end

end
