require './lib/library.rb'
require 'pry'
require 'date'

describe Library do
  it 'should have a collection of books' do
    expect(subject.collection).to be_an_instance_of(Array)
  end

  it 'should make a list of books that are available/unavailable' do
    expect(subject.list_books).to be_truthy
  end

  it 'should be able to change_status of a book to unavailable' do
    index = 0
    subject.collection[0][:available] = true
    subject.change_status(index)
    expect(subject.collection[index][:available]).to eq false
  end

  it 'should set return_date for borrowed books' do
    index = 0
    expected_date = Date.today.next_month.strftime("%d/%m/%y")
    subject.return_date(index)
    expect(subject.collection[index][:return_date]).to eq expected_date
  end

  it 'should show a borrow book menu' do
    expect(subject.show_books_menu).to be_truthy
  end

  it 'should borrow book if available' do
    index = 0
    return_date = Date.today.next_month.strftime("%d/%m/%y")
    subject.create_user('Amanda')
    expect{subject.book_is_available(index)}.to output("You borrowed: The Winds of Winter by G.R.R. Martin. Return by: #{return_date}!\n").to_stdout
  end

  it 'should tell you if book you want to borrow is unavailable' do
    index = 0
    return_date = Date.today.next_month.strftime("%d/%m/%y")
    subject.collection[0][:available] = false
    subject.collection[0][:return_date] = Date.today.next_month.strftime("%d/%m/%y")
    expect{subject.book_is_unavailable(index)}.to output("The Winds of Winter is unavailable. It will be returned by #{return_date}.\n").to_stdout
  end

  it 'error message if searching for non existing author' do
    expect{subject.error_message_no_match}.to output("No matching author.\n").to_stdout
  end

  it 'should be able to create_user' do
    expect{subject.create_user('Amanda')}.to output("Welcome Amanda.\n").to_stdout
  end

  after do
    collection = YAML.load_file('./lib/book_data.yml')
    collection.each { |obj| obj[:available] = true }
    collection.each { |obj| obj[:return_date] = nil }
    File.open('./lib/book_data.yml', 'w') { |f| f.write collection.to_yaml }
  end

end
