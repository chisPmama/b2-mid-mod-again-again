class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def oldest_ticket
    tickets.sort_oldest_2_newest.first
  end

end