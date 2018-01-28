require './lib/library.rb'
require 'yaml'

describe Library do
  subject {described_class.new}

  let(:library_books) { YAML::load_file(File.join(__dir__, '../lib/data.yml')) }

  before do
    #@library = Library.new
    #@library_books = YAML::load_file(File.join(__dir__, '../lib/data.yml'))
  end

  after do
    # put yaml file in original state
  end

  it 'can create an instace of a library' do
    expect(subject).to be_kind_of Library
  end

  it 'responds to "books"' do
    expect(subject).to respond_to(:books)
  end

  it 'can print a list of books from YAML-file' do
    expect(subject.books).to eq library_books
  end

  #Not implementet yet
  xit 'prints only available books' do
    expect(subject.list_available_books).to eq
  end

  xit 'returns search-results from search' do
    what_i_expect_to_see = {item: {title: ''}}
    expect(subject.search_books_by_title('Alfons', true))
      .to eq what_i_expect_to_see
  end

  xit 'returns available books from search' do
    expect(subject.search_books('Alfons', true)).not_to be_nil
  end

  xit 'returns unavailable books from search' do
    expect(subject.search_books('Åberg', false)).not_to be_nil
  end

end
