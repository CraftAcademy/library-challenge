require './lib/visitor.rb'
require 'date'

describe Visitor do

    it 'can checkout book' do
        expected_output = {:item => {:title => "A Game of Thrones", :author => "George R.R. Martin"}, :available => false, :return_date => Date.today.next_month.strftime('%d/%m/%y') }
        expect(subject.checkout_book).to eq expected_output
    end

end

