require './lib/librarian.rb'
require 'date'

describe Librarian do
    let(:visitor) { instance_double('Visitor', rented_books: []) }

    it 'librarian checks if he has a list of the books' do
    expect(subject.list).not_to be nil
    end

    it 'librarian can check the availability of a specific title' do
    expect(subject.check_availability('Big Fish')).to be true
    end
    

    describe 'check_out method' do
        
        it 'it changes availability' do
            title = 'Big Fish'
            subject.check_out(title, visitor)
            expect(subject.check_availability(title)).to eq false
        end

        it 'it sets a return date on the book' do
            title = 'Big Fish'
            subject.check_out(title, visitor)
            expected_output = Date.today.next_month.strftime('%d/%m')
            expect(subject.check_return_date(title)).to eq expected_output
        end

        it 'it prints the return date' do
            title = 'Big Fish'
            date = Date.today.next_month.strftime('%d/%m')
            expected_output = "Thanks for using our library, please return the book before: #{date}, thanks!"
            expect { subject.check_out(title, visitor) }.to output(expected_output).to_stdout
        end

        it 'it checks availability if a book is rented out' do
            title = 'Big Fish'
            subject.check_out(title, visitor)
            expect { subject.check_out(title, visitor) }.to raise_error "The book is already rented!"
        end

    end

    it 'can check return date on specific title' do
        title = 'Big Fish'
        subject.check_out(title, visitor)
        expected_output = Date.today.next_month.strftime('%d/%m')
        expect(subject.check_return_date(title)).to eq expected_output
    end

    it 'raises error on check return date if book is not rented out' do
        title = 'Moby Dick'
        expect { subject.check_return_date(title) }.to raise_error 'Book is not rented out.'
    end

end