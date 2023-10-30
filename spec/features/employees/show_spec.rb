require 'rails_helper'

RSpec.describe "Employee Show Page" do
  before(:each) do
    test_data
  end

  describe '#Viewing the Employee Show Page - US 2' do
    it 'when viewing employee show page can see employee name and department' do
      visit "/employees/#{@tashi.id}"
      expected_ticket_subjs = @tashi.tickets.pluck(:subject)
      expect(page).to have_content(@tashi.name)
      expect(page).to have_content(@tashi.department.name)

      expected_ticket_subjs.each do |subj|
        expect(page).to have_content(subj)
      end

    end

    it 'returns the tickets in order from oldest to newest' do
      visit "/employees/#{@tashi.id}"
      expect(@ticket2.subject).to appear_before(@ticket1.subject)
      expect(@ticket1.subject).to appear_before(@ticket3.subject)
    end

    it 'lists the oldest ticket for the user separately' do
      visit "/employees/#{@tashi.id}"
      oldest_ticket = @tashi.tickets.sort_oldest_2_newest.first
      expect(page).to have_content("Oldest ticket assigned: Ticket ##{oldest_ticket.id}")
    end
  end

  describe '#Viewing the Employee Show Page - US 3' do
    it 'does not list any tickets not assigned to employee' do
      visit "/employees/#{@tashi.id}"
      ticket = Ticket.create!(subject: "Clean off gum under cubicle desk", age: 1)
      expect(page).to_not have_content(ticket.subject)
    end

    it 'has a form submission for a new ticket that already exists in the database' do
      visit "/employees/#{@tashi.id}"
      fill_in "New ticket", with: "Install new outlet by fish tank in HR office"
      click_button "Submit"
    end

    xit 'after submission, returns to same page with new ticket listed' do
      visit "/employees/#{@tashi.id}"
      fill_in "New ticket", with: "Install new outlet by fish tank in HR office"
      click_button "Submit"
      expect(current_path).to eq("/employees/#{@tashi.id}")
      expect(page).to have_content("Install new outlet by fish tank in HR office")
    end

  end
end