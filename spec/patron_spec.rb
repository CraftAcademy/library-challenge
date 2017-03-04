require 'yaml'
require './lib/patron.rb'

#collection = YAML.load_file('./lib/booksdb.yml')
patron = YAML.load_file('./lib/patrondb.yml')

describe Patron do

  it 'can view the list of books currently available in the library' do
      expect(subject.available_books).not_to eq nil
  end

  it 'can view the list of the checked out books' do
       expect(subject.checkedout_book_list).to eq patron.select { |obj| obj[:available] == false  }
  end


end
