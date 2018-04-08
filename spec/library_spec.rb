require './lib/library.rb'
require 'yaml'
require 'date'

describe Library do
  before :each do
    @list = YAML.load_file('./lib/data.yml')
  end

  it 'displays books in library' do
    expect(subject.list).to eq @list
  end

  it 'searches for a book by title' do
    expect(subject.search_title('Someone To Watch Over Me')).to eq [{item: {title: "Someone To Watch Over Me", author: "Yrsa Sigurdardottir"}, available: true, return_date: nil}]
  end

  it 'searches for a book by author' do
    expect(subject.search_author('Stephen King')).to eq [{item: {title: "Joyland", author: "Stephen King"}, available: false, return_date: '2018-05-06'},
      {item: {title: "The Shining", author: "Stephen King"}, available: true, return_date: nil}]
  end

  it 'search for available books' do
    expect(subject.available_books).to eq [{item: {title: "Someone To Watch Over Me", author: "Yrsa Sigurdardottir"}, available: true, return_date: nil},
      {item: {title: "I Remember You", author: "Yrsa Sigurdardottir"}, available: true, return_date: nil}, {item: {title: "Häxan", author: "Camilla Läckberg"}, available: true, return_date: nil},
      {item: {title: "The Shining", author: "Stephen King"}, available: true, return_date: nil}]
  end

  it 'lends out a book and sets return date' do
    date = Date.today.next_month
    book = subject.list.select.first { |book| book[:item][:title] == 'I Remember You' }
    expect(book[:return_date]).to eq nil
    expected_output = "This book is available and should be returned before #{date}"
    expect(subject.lends_book('I Remember You')).to eq expected_output
  end

  
end
