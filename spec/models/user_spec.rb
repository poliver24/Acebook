require 'rails_helper'

RSpec.describe User, type: :model do
   
  subject {
    described_class.new(name: "Peter", email: "peter@test.com", password: "123456")
  }

  it "is valid with valie attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid email" do
    subject.email = "Peter"
    expect(subject).to_not be_valid
  end

  it "doesn't have a valid password if it's over 10 character" do
    subject.password = "peterstevenspassword"
    expect(subject).to_not be_valid
  end
end


# subject {
#   described_class.new(title: "Anything",
#                       description: "Lorem ipsum",
#                       start_date: DateTime.now,
#                       end_date: DateTime.now + 1.week,
#                       user_id: 1)
# }

# it "is valid with valid attributes" do
#   expect(subject).to be_valid
# end
