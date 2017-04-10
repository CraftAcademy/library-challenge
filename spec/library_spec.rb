require 'date'
require 'pry-byebug'
require './lib/library.rb'


describe Library do

  it 'checks that there is a collection of books' do
    expect(:book).not_to be_empty
  end

  it 'checks list of books available' do
    expected_output = [
      {item: {title: "Alfons och soldatpappan", author: "Gunilla Bergström"}, available: true, :return_date=>nil},
      {item: {title: "Skratta lagom! Sa pappa Åberg", author: "Gunilla Bergström"}, available: true, :return_date=>nil},
      {item: {title: "Pippi Långstrump", author: "Astrid Lindgren"}, available: true, :return_date=>nil},
      {item: {title: "Pippi Långstrump går ombord", author: "Astrid Lindgren"}, available: true, :return_date=>nil},
      {item: {title: "The Coding Dojo", author: "Emily Bash"}, available: true, :return_date=>nil}]
    expect(subject.books_instock).to eq expected_output
  end

  it 'allows to search for a particular book' do
    expected_output = {item: {title: "Pippi Långstrump", author: "Astrid Lindgren"}, available: true, return_date: nil}
    expect(subject.book_available?("Pippi Långstrump", "Astrid Lindgren")). to eq expected_output
  end

  it 'allows check out of book from the library' do
    return_duration = 1       # Value is in months
    today = Date.today
    next_month = today >> return_duration
    due_date = next_month.strftime('%d/%m/%y')
    expected_output = {
      title: "Pippi Långstrump",
      author: "Astrid Lindgren",
      message: "Book successfully borrowed",
      return_date: due_date }
    expect(subject.book_checkout("Pippi Långstrump", "Astrid Lindgren")).to eq expected_output
  end

  it "should raise errror if book doesn't exist" do
    execute = proc { subject.book_checkout("Clean Code", "Robert.C.Martins")}
    expect { execute.call }.to raise_error "You can't borrow a book that is not available"
  end
end
