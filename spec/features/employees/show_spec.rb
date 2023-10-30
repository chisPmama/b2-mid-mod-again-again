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

    xit 'returns the tickets in order from oldest to newest' do

    end

    xit 'lists the oldest ticket for the user separately' do

    end
  end
end