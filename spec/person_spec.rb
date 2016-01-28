require './lib/person'

describe Person do
  books = [{ title: 'Alfons leker', author: 'A. Andersson' }, { title: 'Bible', author: 'TGAOTU' } ]
  let(:library) { double('Library', books: books)}

  it 'has an empty bookshelf at instatiation' do
    expect(subject.book_shelf).to eq []
  end
  context 'adds book to shelf when' do
    before { allow(library).to receive(:check_out).and_return({ }) }

    it 'searched by :title' do
      subject.get_book(library, title: 'Bible')
      expect(subject.book_shelf).to eq [{ title: 'Bible', author: 'TGAOTU' }]
    end

    it 'searched by :author' do
      subject.get_book(library, author: 'TGAOTU')
      expect(subject.book_shelf).to eq [{ title: 'Bible', author: 'TGAOTU' }]
    end
  end
end
