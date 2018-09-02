require './lib/library.rb'
require 'date'
require 'yaml'
require 'pry'

describe Library do

    before do
        db1 = YAML.load_file('./lib/default.yml')
        db2 = YAML.load_file('./lib/borrower_default.yml')
        File.open('./lib/books_database.yml', 'w') { |f| f.write db1.to_yaml}
        File.open('./lib/borrower_list.yml', 'w') { |f| f.write db2.to_yaml}    
    end
    after do
        db1 = YAML.load_file('./lib/default.yml')
        db2 = YAML.load_file('./lib/borrower_default.yml')
        File.open('./lib/books_database.yml', 'w') { |f| f.write db1.to_yaml}
        File.open('./lib/borrower_list.yml', 'w') { |f| f.write db2.to_yaml} 
    end  
    

    let(:borrower) {instance_double('Borrower', name: 'Robin', borrowed_books: [], id: nil, status: nil)}
    before do
        allow(borrower).to receive(:id=)
        allow(borrower).to receive(:borrowed_books=)        
        allow(borrower).to receive(:status=)                
    end             

    it 'has a collection of books' do
        expect(subject.books).not_to be nil
    end

    it 'can provide visitor with a list of available books' do
        expect(subject.available_books).not_to be nil
    end

    it 'should be able to search for book titles in database' do
        expected_output = [{:available=>true,
            :item=>{:author=>"Gunilla Bergström", :title=>"Alfons och soldatpappan"},
            :return_date=>nil},
            {:available=>true,
            :item=>{:author=>"Gunilla Bergström", :title=>"Osynligt med Alfons"},
            :return_date=>nil}]

        expect(subject.search("Alfons")).to eq expected_output
    end

    it 'should be able search for authors in database' do
        expected_output = [{:available=>true,
            :item=>{:author=>"Astrid Lindgren", :title=>"Pippi Långstrump"},
            :return_date=>nil},
            {:available=>true,
            :item=>{:author=>"Astrid Lindgren", :title=>"Pippi Långstrump går ombord"},
            :return_date=>nil}]

        expect(subject.search("Astrid Lindgren", "author")).to eq expected_output
    end

    it 'should be able to search and return only available books with that search string' do
        expected_output = [{:available=>true,
            :item=>{:author=>"Gunilla Bergström", :title=>"Alfons och soldatpappan"},
            :return_date=>nil},
            {:available=>true,
            :item=>{:author=>"Gunilla Bergström", :title=>"Osynligt med Alfons"},
            :return_date=>nil}]

        expect(subject.search("Gunilla Bergström", "author", true)).to eq expected_output
    end

    it 'should allow visitor to checkout a book' do
        subject.checkout("Pippi Långstrump", borrower)
        expect(subject.books[3][:available]).to eq false        
    end
    
    it 'should place book and return date in visitor instance upon checkout' do
        expected_output = [{title: "Pippi Långstrump", return_date: Date.today.next_month.strftime("%y-%m-%d")}]
        subject.checkout("Pippi Långstrump", borrower)
        expect(borrower.borrowed_books).to eq expected_output
    end

   it 'should have a way of tracking who borrowed which book' do        
        subject.checkout("Pippi Långstrump", borrower)
        expected_output = [{name: "Robin",
            id: borrower.id,
            status: borrower.status,
            borrowed_books: [{
                title: "Pippi Långstrump",
                return_date: Date.today.next_month.strftime("%y-%m-%d")}]
            }]
        expect(subject.borrower_list).to eq expected_output
    end

    it 'should give error if borrower status is false' do
        allow(borrower).to receive(:id).and_return(999999)
        allow(borrower).to receive(:status).and_return(false)   
        expect {subject.checkout("Pippi Långstrump", borrower)}.to raise_error "Status is false. This prevents your from borrowing books. Contact the reception"
    end

    it 'should give error if borrower has borrowed books and not returned them in time' do
        allow(borrower).to receive(:id).and_return(999999)
        allow(borrower).to receive(:status).and_return(true)
        allow(borrower).to receive(:borrowed_books).and_return([{title: "Skratta lagom! Sa pappa Åberg", return_date: "2017-01-01"}])   
        expect {subject.checkout("Pippi Långstrump", borrower)}.to raise_error "You have books that haven't been returned on time. Please return them before borrowing another book"
    end

    it 'should be able to save the borrowed books list to a database' do
        subject.checkout("Pippi Långstrump", borrower)
        db = YAML.load_file('./lib/borrower_list.yml')
        expect(db[0][:name]).to include("Robin")
    end

end

