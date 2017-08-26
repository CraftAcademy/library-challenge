require './lib/library.rb'

describe Library do
  before do
  end

  after do
    collection = YAML.load_file('./lib/books.yml')
    collection.each { |obj| obj[:available] = true }
    File.open('./lib/books.yml', 'w') { |f| f.write collection.to_yaml }
  end

  it 'lists available books, and displays the other and the title' do
    expected_output = [{:item=>{:title=>"Alfons och soldatpappan",
      :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Skratta lagom! Sa pappa Åberg",
        :author=>"Gunilla Bergström"}, :available=>true, :return_date=>"2016-05-25"},
      {:item=>{:title=>"Osynligt med Alfons",
        :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"},
      :available=>true, :return_date=>nil},
      {:item=>{:title=>"Pippi Långstrump går ombord",
        :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.list_available).to eq expected_output
  end

  it 'lists all books in the collection' do
    expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>"2016-05-25"},
      {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
  end
    it 'librarian can search for books' do
      expected_output = (subject.search_books)
  end

end
