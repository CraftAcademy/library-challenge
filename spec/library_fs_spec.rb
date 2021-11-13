require "./lib/library_fs.rb"
require "./lib/book.rb"
require "date"

describe Book do
    subject { described_class.new(author: "Brandon Sanderson",title: "Way of Kings"  ) }

    #let(:book) { instance_double("Book", author: "Brandon Sanderson", title: "Way of Kings" )} #, book: 'Way of Kings', return_date: nil

    it "is expected to contain Brandon Sanderson" do
        expect(subject.author).to eq "Brandon Sanderson"
    end

    it "is expected to contain Way of Kings"  do
        expect(subject.title).to eq "Way of Kings"
    end


end