require './lib/library.rb'

describe Library do
  let(:person) {double('Person')}

  it 'has a list of items' do
    expect(subject.items).not_to be nil
  end

  it 'sets return_date' do
    subject.set_return_date(0)
    expect(subject.items[0][:return_date]).to eq(subject.return_date(0))
  end

  it 'has a book to lend' do
    expect(subject.items[0][:available]).to eq(true)
  end

  it 'allows checkouts' do
    subject.check_out(0)
    expect(subject.items[0][:available]).to eq(false)
  end

  it 'has returndate on checked out book' do
    subject.check_out(0)
    expect(subject.items[0][:return_date]).to eq(subject.return_date(0))
  end

  it 'allows returns' do
    subject.check_in(0)
    expect(subject.items[0][:available]).to eq(true)
  end

end
