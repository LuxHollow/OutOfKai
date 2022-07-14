require 'rails_helper'

# RSpec.describe User, type: :model do
#   it "cannot exist without user" do 
#     user = User.new 
#     user = User.create!
#     User.create! = (email:'ciao', password:'dd')
#     event.user = user
#     expect(user.save!).to eq(true)   
#   end
# end

RSpec.describe User, :type => :model do
  subject { 
         described_class.new(password: "sdsdsd", 
                             email: "luca@loka.com"
         )  
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end