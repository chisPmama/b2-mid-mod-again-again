class Department < ApplicationRecord
  has_many :employees

  def employee_names
    employees.pluck(:name).join(", ")
  end
end