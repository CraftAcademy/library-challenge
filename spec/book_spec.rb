require './lib/book.rb'

describe Book do
  let(:book) {described_class.new('managment 101', 'rich')}


  it 'should respond to title' do
    expect(book).to respond_to :title
    expect(book.title).to eq 'managment 101'
  end

  it 'should respond to author' do
    expect(book).to respond_to :author
    expect(book.author).to eq 'rich'
  end

end
