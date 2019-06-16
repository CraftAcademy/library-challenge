require "./lib/library.rb"

describe Library do
    
    it 'can read the YAML file with all the books' do
        expected_output = YAML.load_file('./lib/inventory.yml')
        expect(subject.inventory).to eq expected_output
    end

    it "must be able to search for title to see a book and if its available" do
        expected_output = YAML.load_file('./lib/inventory.yml').select { |book| book[:title].include? "Osynligt" }
        expect(subject.search_by_title("Osynligt med Alfons")).to eq expected_output
    end
     
    it "must be able to search for author to see a book and if its available" do
        expected_output = YAML.load_file('./lib/inventory.yml').select { |book| book[:author].include? "Astrid Lindgren" }
        expect(subject.search_by_author("Astrid Lindgren")).to eq expected_output
    end
        
    it "if book is available visitor must be able to borrow it" do 
        expected_output = "You can borrow the book but fuck you if u ruin it"
        expect(subject.borrow("Pippi Långstrump")).to eq expected_output
    end

    it "when a book is borrowed, the visitor must be able to return it" do
        expect_output = "motherfucker, i bet u didnt even finnished it"
        expect(subject.return("Alfons och soldatpappan")).to eq expect_output
    end
    end 

    # it 'can search for a book by its author' do
    #     expect(subject.search_by_author).to eq ??
    # end

    # it 'return avaiable if the status of book is avaiable' do
    #     expect(subject.books_status).to eq :availeble
    # end

    # it 'return borrowed if the status of the book is non-available' do
    #     expect(subject.books_status).to eq :borrowed
    # end

    # it 'is expected to raise error if the book does not exist in the library' do
    #     # expect { described_class.new }.to raise_error 'The book does not exist'
    # end
    
    # it 'is expected to have an return date on initialize' do
    #     expected_date = Date.today.next_month(1).strftime("%d/%m")
    #     expect(subject.return_date).to eq expected_date
    # end
