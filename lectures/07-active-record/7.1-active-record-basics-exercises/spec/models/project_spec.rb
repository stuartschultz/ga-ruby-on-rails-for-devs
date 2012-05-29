require 'spec_helper'

describe Project do

  context "validations" do
    it { should validate_presence_of :name }
  end

  context "associations" do
    it { should have_many :employeeprojects }
    it { should have_many(:employees).through(:employeeprojects) }
  end

end
