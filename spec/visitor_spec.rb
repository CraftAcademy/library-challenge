require './lib/visitor'
require './lib/library'

describe Visitor do
  subject { described_class.new(name: 'Serge') }

  it 'is expected to have a name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to be able to search for all available books' do
    list_of_books = YAML.load_file('./lib/base_data.yml')
    expected_output = list_of_books.select { |obj| obj[:available] == true }
    expect(subject.list_available_books).to eq expected_output
  end
end
