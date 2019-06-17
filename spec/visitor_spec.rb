require "./lib/visitor.rb"

describe Visitor do
    subject {described_class.new(name: "Alfred")}

    it "should have a name for record purposes" do
        expect(subject.name).not_to be nil
    end

    it "is expected to raise error if no name is set" do
        expect { described_class.new }.to raise_error "A name is required"
    end

    it "has empty checked out book list" do
        expect(subject.checkedout_books).to be {}
    end

    it "should be able to see full list of books" do
        expect(subject.see_book_list).not_to be_empty
    end

    it "should be able to find a specific book by title" do
         expect(subject.find_by_title("Alfons och soldatpappan")).not_to eq nil
    end

    it "should be able to find a specific book by author" do
        expect(subject.find_by_author("Gunilla Bergström")).not_to eq nil
   end

    it "should be able to change book to unavailable when checkout" do
        
    end

    it "should be able to change book to available when checkin" do
        
    end

    it 'should be able to see a book status' do
    
    end
        
end