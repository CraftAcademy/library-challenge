require './lib/library.rb'
require 'date'
require 'yaml'
require 'pry'


describe Library do
  it 'has a catalog of books' do
    expected_catalog = YAML.load_file('./lib/data.yml')
    expect(subject.catalog).to eq expected_catalog
  end

  it 'checks list of books' do
    expect(subject.list_available_books).not_to be_empty
  end

  it 'show list of books' do
    result =  subject.find_title("Pippi Långstrump går ombord")
      expected_item = {item: {title: "Pippi Långstrump går ombord",
                      author: "Astrid Lindgren"}, available: false,
                      return_date: "2016-07-30"}
      expect(result).to include expected_item
    end

    describe '#checkout is expected' do
        let(:person) { instance_double('Person') }

        before do
          allow(person).to receive(:my_books).and_return([])
          subject.checkout(book, person)
          collection = YAML.load_file('./lib/catalog.yml')
          @updated_book = collection.detect { |item| item[:item][:title] == book[:item][:title] }
        end
    end

    it 'to set :available to false' do
      expect(@updated_book[:available]).to eq false
    end

    it 'to set a return date' do
      expect(@updated_book[:return_date]).to eq Date.today.next_month
    end
end
