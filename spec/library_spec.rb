require './lib/library.rb'

describe Library do

  let(:person) { double('Person', check_out: true, check_in: true)}

  it 'has a list of books on initialize' do
    expect(subject.items).to be_kind_of Array
  end

  it 'should be able to lend books to the person' do
    expected_output = {item: {title: "Alfons och soldatpappan", author: "Gunilla Bergström"}, available: false, return_date: Date.today + 30 }
    expect(subject.perform_checkout('Alfons och soldatpappan')).to eq expected_output
  end

  it 'should reject check out if book is not available' do
    expect(subject.check_out('Skratta lagom! Sa pappa Åberg')).to eq 'Book is not available'
  end

  it 'should be able to receive books from person' do
    expected_output = {item: {title: 'Skratta lagom! Sa pappa Åberg', author: 'Gunilla Bergström'}, available: true, return_date: '' }
    expect(subject.perform_checkin('Skratta lagom! Sa pappa Åberg')).to eq expected_output
  end

end
