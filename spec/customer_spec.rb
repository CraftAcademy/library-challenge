require './lib/keeper.rb'
require 'date'
require './lib/customer.rb'


describe Customer do
    let(:name) {'Arun'}

    let:(:keeper){instance_double}('Keeper', books: [])
    subject{Customer.new(name)}

    before do
        allow(keeper).to receive(check_out)
    end

    it 'is expected to have a name on start' do
        expect(subject.name).to eq name
    end

    it 'is expected to have a list of books on start' do
        expect(subject.books).to eq []
    end

    it 'is expected to be error if there is no keeper' do
        expect{subject.borrow({})}.to  raise_error ('Required keeper')
    end

    it 'is expected to be error if there is no list of books' do
        expect{subject.borrow({keeper: keeper})}.to raise_error ('Requred list of books')
    end


    


    





end