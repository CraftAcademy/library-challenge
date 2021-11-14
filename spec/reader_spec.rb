require './lib/books.rb'

describe Books do
    subject { Books.new }

    it "is return the books title of Four Hour Work Week" do
        expect(subject.title).to eq "Four Hour Work Week"    
    end

    it "is expected to return the author of the title" do
            expect(subject.author).to eq "Tim Ferriss"
        end

        
end
