require './lib/library.rb'
require 'yaml'

describe Library do

  before(:each) do
    @library = Library.new
    @library_books = YAML::load_file(File.join(__dir__, '../lib/data.yml'))
  end

  it 'can create an instace of a library' do
    library = Library.new
    expect(library).to be_kind_of Library
  end

  it 'responds to "books"' do
    expect(@library).to respond_to(:books)
  end

  it 'can print a list of books from YAML-file' do
    expect(@library.list_books).to eq @library_books
  end

  #Not implementet yet
  xit 'prints only available books' do
    expect(subject.list_available_books).to eq
  end

  it 'returns search-results from search' do
    expect(subject.search_books('Alfons', true || false)).not_to be_nil
  end

  it 'returns available books from search' do
    expect(subject.search_books('Alfons', true)).not_to be_nil
  end

  it 'returns unavailable books from search' do
    expect(subject.search_books('Åberg', false)).not_to be_nil
  end

end
