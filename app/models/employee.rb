class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def oldest_ticket
    tickets.sort_oldest_2_newest.first
  end

  def find_other_employees
    employee_tickets_ids = EmployeeTicket.where(employee_id: self.id).pluck(:ticket_id)
    # shared_employees = EmployeeTicket.where(employee_tickets: { ticket_id: :employee_tickets_ids })
  end

end