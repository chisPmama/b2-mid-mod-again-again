require "rails_helper"

RSpec.describe Employee, type: :model do
  before :each do
    test_data
  end

  describe "relationships" do
    it { should belong_to :department }
    it { should have_many :employee_tickets}
    it { should have_many(:tickets).through(:employee_tickets)}
  end

  it 'can put tickets in order from oldest to newest' do
    ticket_order = [@ticket2, @ticket1, @ticket3]
    tickets = Ticket.all
    expect(tickets.sort_oldest_2_newest).to eq(ticket_order)
  end

end