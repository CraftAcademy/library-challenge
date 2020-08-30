require './lib/visitor.rb'

describe Visitor do


  #In order to borrow a book, the visitor should be able to search by keywords

  it 'can search for a certain book' do
    expect(subject.book_by_keywords).not_to eq nil

  end

  #In order to checkout a book, we need to modify the status of them

  it 'Can checkout a book' do
    expected_output = {:item => {:title => "Slutet på historien", :author => "Jan Gillou"}, :available => false, :return_date => Date.today.next_day(30).strftime('%d/%m')}
    expect(subject.checkout_a_book).to eq expected_output
end



end