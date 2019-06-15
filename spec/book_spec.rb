require "./lib/book.rb"

describe Book do
    subject {described_class.new(title: "First book", author: "First author", available: true, return_date: "")}

it "is expected to have a title" do
    expect(subject.name).to eq "First book"
end

it "is expected to have an author" do
    expect(subject.name).to eq "First author"
end
it "is expected to be available when not checked out" do
expect(subject.available).to eq true
end
end


describe "rented book" do
    subject {described_class.new(title: "First book", author: "First author", available: false, return_date: "19-07-15")}

it "is expected to have a return date if it is checked out" do
        expect(subject.return_date).to be "A DATE"
end 
end