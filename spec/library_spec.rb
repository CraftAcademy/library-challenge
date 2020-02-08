require './lib/library.rb'
require 'data.yml'

  describe Library  do
  let(:account) { instance_double('Account', password: '1234', borrowed_book: :title,  date: Date.today, due_date: Date.today + 30) }

  before do
    allow(account).to receive(:borrowed_book).and_return(title)
    allow(account).to receive(:title=)
  end

  it "list of books" do
    expect(subject.data.yml).to eq (title)
  end

  it 'books are checked out at borrow' do
    subject.borrowed(title, '1234', account, date: Date.today)
    expect(subject.borrowed_book).to eq title
  end

  it 'allow borrow if last book was returned' do
    expected_output = { status: true, message: 'book borrowed', date: Date.today, due_date: Date.today + 30}
    expect(subject.borrow(title, '1234', account)).to eq expected_output
  end

  it 'rejects withdraw if last book was not returned' do
    expected_output = { status: false, message: 'bring back the last one', date: Date.today, due_date: Date + 30 }
    expect(subject.borrow(title, '1234', account)).to eq expected_output
  end

  it 'reject withdraw if book is not available' do
    subject.book = borrowed
    expected_output = { status: false, message: 'book is already been borrow', date: Date.today }
    expect(subject.books(title, '1234', account)).to eq expected_output  
  end

  it'reject borrow if the pin is wrong' do
    expected_output = { status: false, message: 'wrong password', date: Date.today}
    expect(subject.borrow(title, 9999, account)).to eq expected_output

  end
 


end


