require './lib/library'

describe Library do
  before do
    subject.catalog.each do |item|
      item[:available] = true
      item[:return_date] = nil
    end
  end

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
    let(:person) { instance_double('Person') }

    before do
      allow(person).to receive(:my_books).and_return([])
      subject.checkout(book, person)
      collection = YAML.load_file('./lib/catalog.yml')
      @updated_book = collection.detect { |item| item[:item][:title] == book[:item][:title] }
    end

    it 'to set :available to false' do
      expect(@updated_book[:available]).to eq false
    end

    it 'to set a return date' do
      expect(@updated_book[:return_date]).to eq Date.today.next_month
    end

  end

end
