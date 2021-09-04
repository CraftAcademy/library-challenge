require './lib/library'
require 'date'

describe Library do
  it 'is expected to contain books' do
    expect(subject.available_books).to be_truthy
  end

  it 'is expected to check out books' do
    title = 'Alfons och soldatpappan'
    expected_output = { status: true, message: 'Enjoy', date: Date.today, exp_date: Date.today.next_month }    
    expect(subject.checkout(title)).to eq expected_output
  end

  it 'is expected that when a book is checked out, it is no longer available' do
      #binding.pry
      subject.checkout('Pippi Långstrump')
      checkedout_book = subject.collection.detect { |book| book[:book][:title] == 'Pippi Långstrump' }
      expect(checkedout_book[:available]).to eq false
  end


end
