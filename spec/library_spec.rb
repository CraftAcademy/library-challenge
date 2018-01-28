require './lib/library.rb'
require 'yaml'

describe Library do
  subject {described_class.new}

  let(:library_books) { YAML::load_file(File.join(__dir__, '../lib/data.yml')) }
  #let(:person) {has_overdue_books = true }
  let(:person) {instance_double('Person', :bookshelf => [])}

  before do
    # store yaml file's original state
    @collection = YAML::load_file(File.join(__dir__, '../lib/data.yml'))
  end

  after do
    # put yaml file in original state
    File.open('./lib/data.yml', 'w') { |f| f.write @collection.to_yaml }
  end

describe 'testing YAML-load and reset' do

    it 'YAML is loaded' do
      expect(subject.books).to eq YAML::load_file(File.join(__dir__, '../lib/data.yml'))
    end

    it 'sets a due-date for a book' do
      book = 'Pippi Långstrump'
      expected_output = [{:item=>{:title=>"Alfons och soldatpappan",
                                  :author=>"Gunilla Bergström"},
                                  :available=>false,
                                  :return_date=>"2018-02-05"},
                         {:item=>{:title=>"Skratta lagom! Sa pappa Åberg",
                                  :author=>"Gunilla Bergström"},
                                  :available=>true,
                                  :return_date=>nil},
                          {:item=>{:title=>"Osynligt med Alfons",
                                   :author=>"Gunilla Bergström"},
                                   :available=>true,
                                   :return_date=>nil},
                          {:item=>{:title=>"Pippi Långstrump",
                                   :author=>"Astrid Lindgren"},
                                   :available=>false,
                                   :return_date=>"2018-02-28"},
                          {:item=>{:title=>"Pippi Långstrump går ombord",
                                   :author=>"Astrid Lindgren"},
                                   :available=>true,
                                   :return_date=>nil}]
      expect(subject.set_due_date(book)).to eq expected_output
    end
end


  it 'responds to "books"' do
    expect(subject).to respond_to(:books)
  end

describe 'lists books' do

  it 'can print a list of books from YAML-file' do
    expect(subject.books).to eq library_books
  end

  it 'prints only available books' do
    expected_output = [{:item=>{:title=>"Skratta lagom! Sa pappa Åberg",
                                :author=>"Gunilla Bergström"},
                                :available=>true,
                                :return_date=>nil},
                       {:item=>{:title=>"Osynligt med Alfons",
                                :author=>"Gunilla Bergström"},
                                :available=>true,
                                :return_date=>nil},
                        {:item=>{:title=>"Pippi Långstrump",
                                 :author=>"Astrid Lindgren"},
                                 :available=>true,
                                 :return_date=>nil},
                        {:item=>{:title=>"Pippi Långstrump går ombord",
                                 :author=>"Astrid Lindgren"},
                                 :available=>true, :return_date=>nil}]
    expect(subject.list_available_books).to eq expected_output
  end

  it 'prints only checked_out_books' do
    expected_output = [{:item=>{:title=>"Alfons och soldatpappan",
                                :author=>"Gunilla Bergström"},
                                :available=>false,
                                :return_date=>'2018-02-05'}]
    expect(subject.list_checked_out_books).to eq expected_output
  end

end

describe 'searches books' do

  it 'searches title' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump",
                                :author=>"Astrid Lindgren"},
                                :available=>true,
                                :return_date=>nil},
                       {:item=>{:title=>"Pippi Långstrump går ombord",
                                :author=>"Astrid Lindgren"},
                                :available=>true, :return_date=>nil}]
    expect(subject.search_books_by_title('Pippi')).to eq expected_output
  end

  it 'searches author' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump",
                                :author=>"Astrid Lindgren"},
                                :available=>true,
                                :return_date=>nil},
                       {:item=>{:title=>"Pippi Långstrump går ombord",
                                :author=>"Astrid Lindgren"},
                                :available=>true, :return_date=>nil}]
    expect(subject.search_books_by_author('Astrid')).to eq expected_output
  end

end

describe 'checks out books' do

   it 'can checkout a book thats available' do
     book = 'Osynligt med Alfons'
     expect(subject.checkout(book, person)).to eq 'Osynligt med Alfons'
   end

   it 'cant checkout a book thats already checked out' do
     book = 'Alfons och soldatpappan'
     expect(subject.checkout(book, person)).to eq 'Alfons och soldatpappan'
   end

 end
end
