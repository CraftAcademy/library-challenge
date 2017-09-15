require './lib/library.rb'
require './lib/person.rb'
require 'date'

describe Library do
  let(:person) {instance_double('Person',{:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>'2017-09-27', :renter=>'Olof'})}
# before do
#   books = YAML.load_file('./lib/books.yml')
# end
#   after do
#     books = YAML.load_file('./lib/books.yml')
#     books.each { |obj| obj[:available] = true }
#     File.open('./lib/books.yml', 'w') { |f| f.write books.to_yaml }
#   end

    it 'lists available books, and displays the other and the title' do
      expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil, :renter=>nil},
        {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>"2016-05-25", :renter=>nil},
        {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil, :renter=>nil},
        {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil, :renter=>nil},
        {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil, :renter=>nil}]
      expect(subject.list_available).to eq expected_output
    end

    it 'lists all books in the collection' do
      expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"},
        :available=>true, :return_date=>nil, :renter=>nil},
        {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"},
        :available=>true, :return_date=>"2016-05-25", :renter=>nil},
        {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"},
        :available=>true, :return_date=>nil, :renter=>nil},
        {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"},
        :available=>true, :return_date=>nil, :renter=>nil},
        {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"},
        :available=>true, :return_date=>nil, :renter=>nil}]
      expect(subject.list_all).to eq expected_output
    end

    let 'Raises an error when books are not available' do
      if :available == false
      expect(subject.search_books_).to raise_error(RuntimeError, 'No account present')
    end

    it 'can check when the return date is on the books' do
      expected_output = Date.today.next_month
      expect(subject.check_outdate).to eq expected_output
    end
  end
end
