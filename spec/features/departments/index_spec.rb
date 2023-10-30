require "rails_helper"

RSpec.describe "Department Index" do
  before :each do
    @maintenance = Department.create!(name: "Maintenance", floor: "Upper")
    @tashi = @maintenance.employees.create!(name: "Tashi Smoshi", level: 3)
    @roger = @maintenance.employees.create!(name: "Roger Candy", level: 2)
    @it = Department.create!(name: "IT", floor: "Lower")
    @morgan = @it.employees.create!(name: "Morgan Moon", level: 3)
  end

  it "can list each department name and floor" do
    visit '/departments'
    save_and_open_page
    expect(page).to have_content(@maintenance.name)
    expect(page).to have_content(@maintenance.floor)
    expect(page).to have_content(@tashi.name)
    expect(page).to have_content(@it.name)
    expect(page).to have_content(@it.floor)
    expect(page).to have_content(@morgan.name)

  end

end