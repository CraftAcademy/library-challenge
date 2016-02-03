require './lib/library.rb'
require 'date'

describe Library do
  books = [{title: 'Alfons leker',
            author: 'A. Andersson',
            status: :okay,
            person: :non,
            duedate: ''},
           {title: 'Bible',
            author: 'TGAOTU',
            status: :lended,
            person: :MEEE,
            duedate: "2016-03-01"}]

  subject { described_class.new(books: books) }

  let(:person) { double('person') }

  it 'has a collection of books' do
    expect(subject.books).to be_kind_of Array
  end


  it 'finds and allows rent by title' do
    item = {title: 'Alfons leker'}
    response = {title: 'Alfons leker',
                author: 'A. Andersson',
                status: :lended,
                person: :MEEE,
                duedate: Date.today.next_month.strftime('%F')}

    allow(person).to receive(:portfolio).and_return([])
    expect(subject.lend(item, person)).to eq response
  end
end
