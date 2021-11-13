require "./lib/user.rb"

Rspec.describe User do
  subject { User.new } #keeping temporarily for clarity

  let(:user) { instance_double("User", name: "example_user") }

  it "is expected for user to see if book is available" do
  end

  it "is expected that user can checkout a book" do
  end

  it "is expected that user gets a receipt that states return date" do
  end

  it "is expected that a book that is checked out has a return date in the index" do
  end

  it "is expected that a book that is checked out is listed as not available"
end
