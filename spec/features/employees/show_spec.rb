require 'rails_helper'

RSpec.describe "Employee Show Page" do
  before(:each) do
    test_data
  end

  describe '#initialize' do
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
end