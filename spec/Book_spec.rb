require './lib/Book.rb'

describe Book do
  let(:book) {described_class.new('Ruby Course', 'Tarek')}

  it 'should book has a title' do
    expect(book.title).to eq 'Ruby Course'
  end

  it 'should book has an author' do
    expect(book.author).to eq 'Tarek'
  end

end
