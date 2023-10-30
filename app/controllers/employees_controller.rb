class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    if params[:search] == "ticket" && params[:ticket_id].present? 
      ticket_id = params[:ticket_id]
      @search_tickets = Ticket.where("id::text LIKE ?", "%#{ticket_id}%")
    end
  end
end