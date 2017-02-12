require 'yaml'
require './lib/library.rb'

collection = YAML.load_file('./lib/data.yml')
describe Library do

  subject { described_class.new(name: 'Fabian') }

  it 'list all books in library' do
    expect(subject.all_books).not_to eq nil
  end

  it 'list of books currently available in the library' do
    expect(subject.available_books).not_to eq nil
  end
end
