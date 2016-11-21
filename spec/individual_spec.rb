require 'yaml'
require './lib/individual.rb'
require './lib/library.rb'


describe Individual do
  let(:library) { Library.new }
  before do
    library.books = YAML.load_file('./lib/data_reset.yml')
    subject.borrowed_books = YAML.load_file('./lib/borrowed_books_reset.yml')
  end

  it 'Should have no books upon initialize' do
    expected_output = [{:title=>nil, :return_date=>nil}]
    expect(subject.borrowed_books).to eq expected_output
  end

  describe 'should be able to borrow a book' do

    it 'individual requires a name in order to borrow a book' do
      subject.name = nil
      subject.borrow('Pippi Långstrump går ombord', library).to raise_error 'You need a name in order to borrow a book'
    end

    it 'borrowed_books should be updated with reutrn date and title' do
      subject.borrow('Pippi Långstrump går ombord', library)
      expected_output = [{:title=>"Pippi Långstrump går ombord", :return_date=>"21/12/16"}]
      expect(subject.borrowed_books).to eq expected_output
    end
  end

  #   describe 'should be able to return a book'
  #     it 'if returned, book should be gone from individuals possession(borrowed_books)' do
  #     expected_output = [{:title=>nil, :return_date=>nil}]
  #     subject.return('Pippi Långstrump går ombord', library)
  #     expect(subject.borrowed_books).to eq expected_output
  #   end
  # end
end
