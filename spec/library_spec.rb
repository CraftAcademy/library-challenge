require './lib/library.rb'

describe Library do
  it 'has a collection of books' do
    expect(subject.jane_library.class).to eq Array
  end

  it 'fetches books from a yaml file' do
    expect(subject.jane_library[0][:item][:title]).to eq 'Sense and Sensibility'
  end

  it 'fetches information about book from yaml file' do
    expect(subject.jane_library[0][:item][:published]).to eq '1811'
  end

  it 'rejects lend if book is not available' do
    expected_output = { available: false, message: 'This book is not available' }
  end

  it 'rejects lend if subject have library book at home' do
    expected_output = { available: true, message: 'Return the book you have at home first' }
  end

  it 'allows lend' do
    expected_output =   { available: true, message: 'Return the book after 30 days' }
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_month(1).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end
end
