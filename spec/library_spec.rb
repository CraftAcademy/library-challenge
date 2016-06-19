require './lib/library.rb'
require 'yaml'
require 'date'


describe Library do

  it 'has a collection of books in a file' do
    expected_collection = YAML.load_file('./lib/data.yml')
    expect(subject.collection).to eq expected_collection
  end

  it 'checks if there are books available for checkout' do
    expect(subject.list_available_books).not_to be_empty
  end

  it 'can search for a specific title' do
      result =  subject.find_title("Skratta lagom! Sa pappa Åberg")
      expected_item = {item: {title: "Skratta lagom! Sa pappa Åberg",
                      author: "Gunilla Bergström"}, available: false,
                      return_date: "2016-05-25"}
      expect(result).to include expected_item
  end

  describe '#checkout' do
    it 'returns that book is unavailable when not available' do
      desired_book = "Skratta lagom! Sa pappa Åberg"
      expect(subject.checkout(desired_book)).to eq 'That book is unavailable'
    end

    it 'checked out book should have a correct return date' do
      desired_book = "Alfons och soldatpappan"
      return_date = Date.today.next_month
      expect(subject.checkout(desired_book)[:return_date]).to eq return_date
    end

    it 'changes available status to false when checked out' do
      desired_book = "Alfons och soldatpappan"
      expected_result = {item: {title: "Alfons och soldatpappan",
                      author: "Gunilla Bergström"}, available: false,
                      return_date: Date.today.next_month }
      expect(subject.checkout(desired_book)[:available]).to be_falsey
    end
  end

end
