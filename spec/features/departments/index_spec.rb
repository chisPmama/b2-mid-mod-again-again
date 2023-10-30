require "rails_helper"

RSpec.describe "Department Index" do
  before :each do
    test_data
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