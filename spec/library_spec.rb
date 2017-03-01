require './lib/library.rb'

describe Library do

  let(:person) { double('Person', check_out: true, check_in: true)}

  it 'has a list of books on initialize' do
    expected_output = { title: '', author: '', available: '', return_date: '' }
  end

  it 'should be able to lend books to the person' do
    expected_output = {item: {title: "Alfons och soldatpappan", author: "Gunilla Bergström"}, available: false, return_date: Date.today + 30 }
    expect(subject.perform_checkout('Alfons och soldatpappan')).to eq expected_output
  end

  it 'should reject check out if book is not available' do
    expect(subject.check_out('Skratta lagom! Sa pappa Åberg')).to eq 'Book is not available'
  end

  it 'should be able to receive books from person' do
    expected_output = {item: {title: 'Pettsson och Findus', author: 'Sven Nordqvist'}, available: true, return_date: '' }
    expect(subject.perform_checkin('Pettsson och Findus')).to eq expected_output
  end

  xit 'should set a return date when lending books to person to be 30 days from now' do
    subject.check_out('Pippi Långstrump')
    expected_output = { title: '', author: '', available: '', return_date: Date.today + 30 }
    expect(subject('Pippi Långstrump')).to eq expected_output
  end

end
