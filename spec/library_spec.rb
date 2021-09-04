require './lib/library'
require 'date'

describe Library do
  it 'is expected to contain books' do
    expect(subject.available_books).to be_truthy
  end

  it 'is expected to check out available books' do
    title = 'Alfons och soldatpappan'
    expected_output = { status: true, message: "You've checked out #{title}", date: Date.today,
                        return_date: Date.today.next_month }
    expect(subject.checkout(title)).to eq expected_output
  end

  it 'is expected to not check out unavailable books' do
    title = 'Alfons och soldatpappan'
    return_date = subject.collection.detect { |book| book[:book][:title] == title }[:return_date]
    subject.collection.detect { |book| book[:book][:title] == title }[:available] = false
    expected_output = { status: false, message: "#{title} is not available, please come back after #{return_date.strftime('%D')}.", date: Date.today }
    expect(subject.checkout(title)).to eq expected_output
  end

  it 'is expected that after a book is checked out, it is no longer available' do
    title = 'Pippi Långstrump'
    subject.checkout(title)
    checkedout_book = subject.collection.detect { |book| book[:book][:title] == title }
    expect(checkedout_book[:available]).to eq false
  end
end
