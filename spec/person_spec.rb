require './lib/person.rb'

describe Person do

    it "books are searchable by title or author" do
        expected_output = {:item=>{:title=>"Nalle Puh", :author=>"A. A. Milne"}, :available=>false  , :return_date=>"2016-05-25"}
        expect(subject.book_search("Nalle")).to eq expected_output
    end

end


