require './lib/library'

describe Library do

  let(:book) do
    {item:
         {title: 'Skratta lagom! Sa pappa Åberg',
          author: 'Gunilla Bergström'},
     available: true,
     return_date: nil}
  end

  it 'is expected to have a :catalog' do
    expect(subject.catalog).not_to be nil
  end

  it ':catalog is expected to have items' do
    expect(subject.catalog).to include book
  end

  it ':catalog has 5 items' do
    expect(subject.catalog.count).to eq 5
  end

  describe '#checkout is expected' do

    before do
      subject.checkout(book)
    end

    it 'to set :avaiable to false' do
      expect(book[:available]).to eq false
    end

    it 'to set a return date' do
      expect(book[:return_date]).to eq Date.today.next_month
    end

  end

end
