class Ticket < ApplicationRecord
  has_many :employee_tickets
  has_many :employees, through: :employee_tickets

  def self.sort_oldest_2_newest
    Ticket.all.order(age: :desc)
  end
end