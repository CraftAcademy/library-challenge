require "./lib/library.rb"
require "pry"

describe Library do
  subject { Library.new } #keeping temporarily for clarity

  let(:user) {instance_double("User", example_user: "Loanrobot")}

  it "is expected for library to contain books" do
    expect(subject.books).to eq YAML.load_file('./lib/data.yml')
  end

  it "is ecpected for a user to search for a books author" do
    expected_output = [{:book=>{:title=>"Sömnlös", :author=>"Wilhelm Moberg"}, 
    :available=>false, :return_date=>"2021-01-25"}, {:book=>{:title=>"Utvandrarna", 
    :author=>"Wilhelm Moberg"}, :available=>true, :return_date=>nil}]
    
    expect(subject.search_book_author).to eq expected_output
  end

  it "is expected that user can checkout a book" do
  end

  it "is expected that user gets a receipt that states return date" do
  end

  it "is expected that a book that is checked out has a return date in the index" do
  end

  it "is expected that a book that is checked out is listed as not available"
end
