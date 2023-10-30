# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Department.destroy_all
Employee.destroy_all
Ticket.destroy_all
EmployeeTicket.destroy_all



@maintenance = Department.create!(name: "Maintenance", floor: "Upper")
@it = Department.create!(name: "IT", floor: "Lower")

@tashi = @maintenance.employees.create!(name: "Tashi Smoshi", level: 3)
@roger = @maintenance.employees.create!(name: "Roger Candy", level: 2)
@morgan = @it.employees.create!(name: "Morgan Moon", level: 3)

@ticket1 = Ticket.create!(subject: "Table adjustment for Cindy's cubicle", age: 10)
@ticket2 = Ticket.create!(subject: "Projector not working in Meeting Room 1", age: 12)
@ticket3 = Ticket.create!(subject: "Request for new vending machine in breakroom", age: 5)

EmployeeTicket.create!(employee: @tashi, ticket: @ticket1)
EmployeeTicket.create!(employee: @tashi, ticket: @ticket2)
EmployeeTicket.create!(employee: @tashi, ticket: @ticket3)
EmployeeTicket.create!(employee: @roger, ticket: @ticket1)
EmployeeTicket.create!(employee: @roger, ticket: @ticket2)

