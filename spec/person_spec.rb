require './lib/person.rb'

describe Person do

    subject { described_class.new(name: 'Daniel') }

    it 'is expected to have a :name on initialize' do
        expect(subject.name).not_to be nil
    end
   
    it "to be able to search books by title or author" do
        expected_output = {:item=>{:title=>"Nalle Puh", :author=>"A. A. Milne"}, :available=>true, :return_date=>nil}
        expect(subject.book_search("Nalle")).to eq expected_output
    end

    it "search returns title, author and availability of book" do
        expected_outcome = book_return[:item][:tite] || book_return[:item][:author]
        expect(subject.search_return).to eq expect_outcome
    end 

end 

        # it "shows title, author and availability" do
        #     expect_outcome = book_return[:item][:title]
        #     expect(subject.book_return).to eq expected_outcome
        # end