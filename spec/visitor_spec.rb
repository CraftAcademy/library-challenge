require './lib/visitor.rb'
require 'date'

describe Visitor do

    it 'can checkout book' do
        expected_output = {:item => {:title => "A Game of Thrones", :author => "George R.R. Martin"}, :available => false, :return_date => Date.today.next_month.strftime('%d/%m/%y') }
        expect(subject.checkout_book).to eq expected_output
    end

    it 'can see returning dates of checkout books' do
        expected_output = {:return_date => Date.today.next_month.strftime('%d/%m/%y') }
        expect(subject.show_return_date).to eq expected_output
    end

    it 'can return book' do
        expected_output = {:item => {:title => "A Game of Thrones", :author => "George R.R. Martin"}, :available => true, :return_date => nil }
        expect(subject.return_book).to eq expected_output
    end

end

