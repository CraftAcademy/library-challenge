require './lib/library'
require 'date'

describe Library do
  it 'is expected to contain books' do
    expect(subject.available_books).to be_truthy
  end

  it 'is expected to check out books' do
    title = 'Alfons och soldatpappan'
    expected_output = { status: true, message: 'Enjoy', date: Date.today, exp_date: Date.today.next_month }
    #binding.pry
    expect(subject.checkout(title)).to eq expected_output
  end
end
