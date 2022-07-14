require 'rails_helper'

RSpec.describe Event, type: :model do
  it "cannot exist without user" do 
    belongs_to :user, optional: true
    event = Event.new 
    current = DateTime.current
    event.datestart = current
    event.dateend = current + 1.hour
    user = create(:user)
    event.user = user
    expect(event.save!).to eq(true)   
  end

  it "start event must be until end" do 
    current = DateTime.current
    event = Event.new 
    event.datestart = current
    event.dateend = current
    user = create(:user)
    event.user = user
    expect(event).to_not be_valid 
  end
end

