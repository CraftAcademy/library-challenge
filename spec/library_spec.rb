require './lib/library.rb'

describe Library do
    let(:person) { instance_double('Person', due_date: '04/12')}

    # As a library
    # In order to have good books to offer to the public
    # I would like to be able to have a collection of books
    it 'Initialize collection of books' do
        expect(subject.collection).not_to be nil
    end

    # As a library
    # In order to have good books to offer to the public
    # I would like to be able to allow individuals to check out a book
    it 'Allows person a list of books' do
        expect()
    end

    # As a library
    # In order to make the books available to many individuals
    # I would like to set a return date on every check out
    # and I would like that date to be 1 month from checkout date
    it 'Is expected to be returned one month from checkout date' do
        return_date = Date.today.next_month.strftime('%d/%m')
        expect(subject.due_date).to eq return_date
    end
end