require './lib/library.rb'
require 'date'
require 'yaml'
require 'pry'

describe Library do

    let(:borrower) {instance_double('Borrower', name: 'Robin', borrowed_books: [], id: nil, status: nil)}
    before do
        db = YAML.load_file('./lib/default.yml')
        File.open('./lib/books_database.yml', 'w') { |f| f.write db.to_yaml}
        allow(borrower).to receive(:borrowed_books=)
        allow(borrower).to receive(:id=)
        allow(borrower).to receive(:status=)        
    end

    after do
        db = YAML.load_file('./lib/default.yml')
        File.open('./lib/books_database.yml', 'w') { |f| f.write db.to_yaml}
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
        expect(subject.borrower_list).to include borrower
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

end

