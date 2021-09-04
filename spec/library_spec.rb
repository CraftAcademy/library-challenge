require './lib/library'
require 'yaml'
require 'date'

describe Library do
  after do
    updated_list = YAML.load_file('./lib/test_data.yml')
    File.open('./lib/test_data.yml', 'w') { |f| f.write updated_list.to_yaml }
    # updated_list.detect { |obj| obj[:book][:title].include? title }
  end

  subject { described_class.new }
  it 'is expected to be able to search for books by title' do
    expect(subject.search_for_title('The Expanse')).to eq book: { author: 'James S. A. Corey',
                                                                  title: 'The Expanse' }, available: true,
                                                          return_date: nil
  end

  it 'is expected to be able to search for books by author' do
    expect(subject.search_for_author('James S. A. Corey')).to eq book: { author: 'James S. A. Corey',
                                                                         title: 'The Expanse' }, available: true,
                                                                 return_date: nil
  end

  it 'is expected that a customer can check out a book' do
    expect(subject.checkout_book('The Expanse')).to eq book: { author: 'James S. A. Corey',
                                                               title: 'The Expanse' }, available: false,
                                                       return_date: Date.today.next_month
  end

  it 'is expected that if a book is already checked out it should tell the user it is unavailable' do
    expect(subject.checkout_book('Code')).to eq 'book unavailable'
  end

  it 'is expected that a book that is being checked out has a return date' do
    expect(subject.checkout_book('The Expanse')).to eq book: { author: 'James S. A. Corey',
                                                               title: 'The Expanse' }, available: false,
                                                       return_date: Date.today.next_month
  end



     #Test passing (false positive i think) its because its identical list_of_books.select in spec and method. 
     #Maybe you can continue on it or replace with a test and method that weorks
  describe do
    list_of_books = YAML.load_file('./lib/base_data.yml')
    it 'is expected to be able to search for all available books' do
      expect(subject.list_available_books).to eq list_of_books.select { |obj| obj[:book][:available] == true }
    end
  end
end
