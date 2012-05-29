require 'spec_helper'

describe Employeeproject do

  context "validations" do
    it { should validate_presence_of :employee_id }
    it { should validate_presence_of :project_id }
  end

  context "associations" do
    it { should belong_to :employee }
    it { should belong_to :project }
  end

end
