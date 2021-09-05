require './lib/library'
require 'yaml'
require 'date'

describe Library do
  after do
    updated_list = YAML.load_file('./lib/test_data.yml')
    File.open('./lib/test_data.yml', 'w') { |f| f.write updated_list.to_yaml }
    # updated_list.detect { |obj| obj[:book][:title].include? title }
  end

  let(:visitor) { instance_double('Visitor', name: 'Fraser') }

  subject { described_class.new }

  it 'is expected to be able to search for books by title' do
    expected_output = [{ book: { author: 'James S. A. Corey', title: 'The Expanse' }, available: true,
                         return_date: nil, checked_out_by: nil }]
    expect(subject.search_for_title('The Expanse')).to eq expected_output
  end

  # it 'is expected to return a message saying the book is already checked out' do
  #   expect(subject.search_for_title('Code')).to eq 'Book currently checked out'
  # end

  it 'is expected to be able to search for books by author' do
    expected_output = [{ book: { author: 'James S. A. Corey', title: 'The Expanse' }, available: true, return_date: nil,
                         checked_out_by: nil }]
    expect(subject.search_for_author('James S. A. Corey')).to eq expected_output
  end

  it 'is expected to be able to search for all available books' do
    list_of_books = YAML.load_file('./lib/base_data.yml')
    expected_output = list_of_books.select { |obj| obj[:available] == true }
    expect(subject.list_available_books).to eq expected_output
  end
end
