require './lib/library'

describe Library do
  it 'has collection of books stored in a file' do
    expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"2016-05-25"}, {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.collection).to eq expected_output
  end

  it 'can allow person to see available books' do
    expected_output = 'Book is available for checkout'
    expect(subject.checkout).to eq expected_output
  end

  it 'can allow individuals to checkout a book' do
    expected_output = 'All the books have been borrowed'
    expect(subject.remaining_books).to eq expected_output
  end

  it 'can set return date of book to exactly one month after checkout' do
    expected_date = Date.today.next_month(1).strftime("%d/%m")
    expect(subject.exp_date).to eq expected_date
  end
end
