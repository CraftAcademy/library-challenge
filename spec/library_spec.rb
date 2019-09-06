require './lib/library.rb'
require 'Date'

describe Book do
    it 'has an author' do
        expect(subject.author).to eq(:author)
    end

    it 'has a title' do
        expect(subject.title).to eq (:title)
    end

    it 'has a 30 day return date from check-out' do
        expected_date = Date.today.next_day(30).strftime('%d/%m/%y')
        expect(subject.return_date).to eq expected_date
    end


end
