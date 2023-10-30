class EmployeeTicketController < ApplicationController
  def create
    employee = Employee.find(params[:employee_id])
    ticket = Ticket.find(params[:ticket_id])
    EmployeeTicket.create!(employee: employee, ticket: ticket)
    redirect_to "/employees/#{employee.id}"
  end
end