require './lib/library.rb'

describe Library do

  let(:person) { double('Person', check_out: true, check_in: true)}

  it 'has a list of books on initialize' do
    expected_output = { title: '', author: '', available: '', return_date: '' }
  end

  it 'should be able to lend books to the person' do
    expected_output = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, return_date: Date.today + 30 }
    expect(subject.perform_checkout('Alfons och soldatpappan')).to eq expected_output
  end

  xit 'should reject check_out if book is not available' do
    subject.check_out('Skratta lagom! Sa pappa Åberg')
    expect(subject('Skratta lagom! Sa pappa Åberg')).to eq 'Book is not available'
  end

  xit 'should be able to receive books from person' do
    subject.check_in('Pettsson och Findus')
    expected_output = { title: '', author: '', available: true, return_date: nil }
    expect(subject('Pettsson och Findus')).to eq expected_output
  end

  xit 'should set a return date when lending books to person to be 30 days from now' do
    subject.check_out('Pippi Långstrump')
    expected_output = { title: '', author: '', available: '', return_date: Date.today + 30 }
    expect(subject('Pippi Långstrump')).to eq expected_output
  end

end
