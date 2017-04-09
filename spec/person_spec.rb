require 'date'
require 'pry-byebug'
require './lib/person.rb'
require './lib/library.rb'

describe Person do

  subject {described_class.new}

  it 'should be able to checkout a book from the library' do
    expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.check_books).to eq expected_output
  end

  it 'should be able to checkout a book' do
    expected_output = {
     title: "Pippi Långstrump",
     author: "Astrid Lindgren",
     message: "Book successfully borrowed",
     return_date: Date.today.next_month(1).strftime('%d/%m/%y')
   }
     expect(subject.checkout("Pippi Långstrump", "Astrid Lindgren")).to eq expected_output
  end

end
