require './lib/keeper.rb'
require 'date'
require './lib/customer.rb'


describe Customer do
    let(:name) {'Arun'}

    let(:keeper){instance_double('Keeper', books: [])}
    subject{Customer.new(name)}

    before do
        allow(keeper).to receive(:check_out)
    end

    it 'is expected to have a name on start' do
        expect(subject.name).to eq name
    end

    it 'is expected to have a list of books on start' do
        expect(subject.books).to eq []
    end

    it 'is expected to be error if there is no keeper' do
        expect{subject.borrow({})}.to raise_error ('Required keeper')
    end

    it 'is expected to be error if there is no list of books' do
        expect{subject.borrow({keeper: keeper})}.to raise_error ('Requred list of books')
    end

    it 'is required to update the list of books when' do
        book_to_be_borrowed={title: "Harry Potter",author: "J K Rowling",return_date: Date.today.next_month(1)}
        title_to_be_borrowed = book_to_be_borrowed[:title]
            
        subject.books=[]

        allow(keeper).to receive(:check_out).and_return({status: true,message: "success",book: book_to_be_borrowed})

        expect(keeper).to receive(:check_out).with (title_to_be_borrowed)
        
        subject.borrow({title: title_to_be_borrowed, keeper: keeper})


        expect(subject.books).to eq [book_to_be_borrowed]
    end

    it 'is expected to updates the books when borrow is failure' do
        title_to_be_borrowed = "Harry Potter"
        subject.books = []
        allow(keeper).to receive(:check_out).and_return({status: false,message: "not available",})

        expect(keeper).to receive(:check_out).with(title_to_be_borrowed)
        subject.borrow({
            title: title_to_be_borrowed,
            keeper: keeper
        })
        expect(subject.books).to eq []
    end
end
#checking git hub