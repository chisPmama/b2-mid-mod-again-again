require "rails_helper"

RSpec.describe "Department Index" do
  before :each do
    test_data
  end

  it "can list each department name and floor" do
    visit '/departments'
    expect(page).to have_content(@maintenance.name)
    expect(page).to have_content(@maintenance.floor)
    expect(page).to have_content(@tashi.name)
    expect(page).to have_content(@it.name)
    expect(page).to have_content(@it.floor)
    expect(page).to have_content(@morgan.name)
  end

  it 'can link to an employee show page' do
    visit '/departments'
    click_link "Tashi Smoshi"
    expect(current_path).to eq("/employees/#{@tashi.id}")
  end

end