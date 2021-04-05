require './lib/visitor.rb'
require './lib/library.rb'

describe Visitor do
    let(:library) {Library.new}
    it 'has a name on initialization' do
        expect(subject.name).to eq nil
    end

    it 'has on initialize an empty array' do
        expect(subject.books_loaned).to eq []
    end

    it 'it has on checkout an updated array' do
        library.checkout('Pippi Långstrump', subject)
        expected_output = [{:available=>false, :book=>{:author=>"Astrid Lindgren", :title=>"Pippi Långstrump"}, :return_date=>Date.today.next_day(30).strftime('%d/%m')}]
        expect(subject.books_loaned).to eq expected_output
    end

end