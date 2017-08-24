require './lib/library.rb'
require 'date'

describe Library do

    it 'YAML file should be loaded in book_list' do
      substitude = lambda {subject.book_list[0][:item][:author]}
      expect(substitude.call).to eq 'Terry Pratchett'
    end

    it 'method to create a return date' do
      date = Date.today
      due = Date.today.next_month
      expect(subject.return_date(date)).to eq due
    end
end
