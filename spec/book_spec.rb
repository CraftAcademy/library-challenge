require "./lib/book.rb"

describe Book do
    subject {described_class.new(title: "First book", author: "First author", available: true, return_date: nil)}

    it "is expected to have a title" do
        expect(subject.title).to eq "First book"
    end

    it "is expected to have an author" do
        expect(subject.author).to eq "First author"
    end
    it "is expected to be available when not checked out" do
    expect(subject.available).to eq true
    end


    it "is expected to have a return date if it is checked out" do
        subject.return_date = "2019-07-15"
        subject.available = false
            expect(subject.return_date).to eq "2019-07-15"
    end 

    it "is expected to not have a return date if it is not checked out" do
        subject.available = true
        expect(subject.return_date).to be nil
    end 
end