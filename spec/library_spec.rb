require './lib/library.rb'
require 'date'

describe Library do
   books = [{ title: 'Alfons leker', author: 'A. Andersson', status: :okay, person: :non, duedate: ''},{ title: 'Bible', author: 'TGAOTU', status: :lended , person: :MEEE, duedate: "2016-03-01"} ]
   subject { described_class.new(books: books)}

   #let(:person) { double('person') }
   #let(:duedate) {double('duedates')}


 it 'has a collection of books' do
    expect(subject.books).to be_kind_of Array
 end


 it 'finds and allows rent by title' do
    item = { title: 'Alfons leker'}
    response = { item: { title: 'Alfons leker', author: 'A. Andersson' },
                status: :okay,
                person: :MEEE,
                duedate: :"2016-03-01"}
    expect(subject.books.lend(item)).to eq response
 end
end
