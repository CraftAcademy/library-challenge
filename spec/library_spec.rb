require './lib/library.rb'
require 'yaml'

describe Library do
  subject {described_class.new}

  let(:library_books) { YAML::load_file(File.join(__dir__, '../lib/data.yml')) }
  let(:person) {has_overdue_books = true }

  before do
    # store yaml file's original state
    @collection = YAML::load_file(File.join(__dir__, '../lib/data.yml'))
  end

  after do
    # put yaml file in original state
    File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
  end

  it 'responds to "books"' do
    expect(subject).to respond_to(:books)
  end

describe do

  it 'can print a list of books from YAML-file' do
    expect(subject.books).to eq library_books
  end

  #Not implementet yet
  xit 'prints only available books' do
    expect(subject.list_available_books).to eq
  end

end

describe '#search_books_by_title' do

  it 'returns search-results from search' do
    expected_output = [{:item=>{:title=>"Alfons och soldatpappan",
                                :author=>"Gunilla Bergström"},
                                :available=>true,
                                :return_date=>nil},
                       {:item=>{:title=>"Osynligt med Alfons",
                                :author=>"Gunilla Bergström"},
                                :available=>true,
                                :return_date=>nil}]
    expect(subject.search_books_by_title('Alfons', true))
      .to eq expected_output
  end

  it 'returns available books from search' do
    expect(subject.search_books_by_title('Alfons', true)).not_to be_nil
  end

  it 'returns unavailable books from search' do
    expect(subject.search_books_by_title('Åberg', false)).not_to be_nil
  end

end

describe '#checkout_book' do

  it 'can checkout a book thats available' do
    book = 'Osynligt med Alfons'
    expect(subject.checkout_book(book, person)).to eq "hejsan"
  end

  it 'cant checkout a book thats already checked out' do
    book = 'Alfons och soldatpappan'
    expect(subject.checkout_book(book, person)).to eq "sorry"
  end

end

end
