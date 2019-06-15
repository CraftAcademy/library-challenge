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

    let (:book) { class_double("book", title: 'This Book', author: 'This Author', available: true, due_date: "") }

    it "should be able to find a specific book by title" do
         expect(subject.find_book('This Book')).to eq "This Book"
    end
        
end