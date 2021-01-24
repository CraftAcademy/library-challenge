require './lib/librarian.rb'
require 'date'

describe Librarian do

    it 'librarian checks if he has a list of the books' do
    expect(subject.list).not_to be nil
    end

    it 'librarian can check the availability of a specific title' do
    expect(subject.check_availability('Big Fish')).to be true
    end
    
    describe 'check_out method' do
        
        it 'it changes availability' do
            title = 'Big Fish'
            subject.check_out(title)
            expect(subject.check_availability(title)).to eq false
        end

        it 'it sets a return date on the book' do
            title = 'Big Fish'
            subject.check_out(title)
            expected_output = Date.today.next_month.strftime('%d/%m')
            expect(subject.check_return_date(title)).to eq expected_output
        end

        it 'it prints the return date' do
            title = 'Big Fish'
            date = Date.today.next_month.strftime('%d/%m')
            expected_output = "Thanks for using our library, please return the book before: #{date}, Thanks!"
            expect { subject.check_out(title) }.to output(expected_output).to_stdout
        end

    end

    
end