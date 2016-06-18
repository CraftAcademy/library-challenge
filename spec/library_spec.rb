require './lib/library.rb'
require 'yaml'
require 'date'


describe Library do

  let(:library) { class_double('Library') }

  it 'has a collection of books in a file' do
    expected_collection = YAML.load_file('./lib/data.yml')
    expect(subject.collection).to eq expected_collection
  end

  # it 'checked out books recieve a return date' do
  #   expected_return_date = Date.today.next_month
  #   expect(library.set_return_date).to eq expected_return_date
  # end
  #
  # it 'checks for books that are available for checkout' do
  #   allow
  #   library
  # end
  #
  # it 'books can be checked out' do
  #   expect(library.check_out)         # will come back to this later.
  # end
end
