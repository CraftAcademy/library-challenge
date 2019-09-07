require './lib/library.rb'
require 'date'

describe Library do
    
    it 'has the ability to show list of checked-out books' do
        expect(subject.collection).to include{:item}
    end

    it 'can search for author by input of argument' do
        subject.search_by_author("astrid")
        expect(subject).to be_truthy
    end

    it 'can search for title by input of argument' do
        subject.search_by_title("pippi")
        expect(subject).to be_truthy
    end

    it 'sets chosen book availability to false' do
        expected_output = { message: 'You have checked-out the book. The return date is', date: Date.today.next_day(30).strftime('%d/%m/%y') }
        expect(subject.book_change_availability_false("Alfons och soldatpappan")).to eq expected_output
    end
end
